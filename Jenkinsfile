ios.prepareEnv(xcode: "/Applications/Xcode_9.2.app")

// Unlock Bitbucket Server credentials for Danger
def unlockBitbucketDangerCredentials(block) {
  withCredentials([usernamePassword(credentialsId: 'pgs-software-bitbucket-server-danger_user', passwordVariable: 'DANGER_BITBUCKETSERVER_PASSWORD', usernameVariable: 'DANGER_BITBUCKETSERVER_USERNAME')]) {
    block()
  }
}

def unlockGitHubDangerCredentials(block) {
  withCredentials([usernamePassword(credentialsId: 'pgs-github-PGSJenkins-token', passwordVariable: 'DANGER_GITHUB_API_TOKEN', usernameVariable: '')]) {
    block()
  }
}

// Repository detection
def job = env.JOB_NAME.tokenize("/")[0]
def unlockDangerCredentials = this.&unlockBitbucketDangerCredentials
if (job =~ /.*github.*/) {
  echo "Repo: GitHub"
  unlockDangerCredentials = this.&unlockGitHubDangerCredentials
} else {
  echo "Repo: Bitbucket"
}

// Prepare
// - reset simulators
def prepareStage() {
  stage("Prepare") {
    sh '''
      # Reset simulators
      bundle exec fastlane snapshot reset_simulators --force --ios 11.1

      # Install dependnecies
      bundle exec fastlane prepare
    '''
  }
}

// Perform tests
def testStage(scheme, platform, deviceName, deviceOS) {
  stage("${deviceName} ${deviceOS}") {
    withEnv(["SCHEME=${scheme}", "PLATFORM=${platform}", "DESTINATION_NAME=${deviceName}", "DESTINATION_OS=${deviceOS}"]) {

      try {
        sh '''
          bundle exec fastlane test "scheme:${SCHEME}" "destination:platform=${PLATFORM},name=${DESTINATION_NAME},OS=${DESTINATION_OS}"
        '''
      }
      finally {
        try {
          sh '''
            bundle exec golden_rose generate "output/AutoMate.test_result"
            mv "index.html" "output/index_${DESTINATION_NAME}_${DESTINATION_OS}.html" || true
            mv "output/report.html" "output/report_${DESTINATION_NAME}_${DESTINATION_OS}.html" || true
          '''
        } finally {}
        ios.archive()
        publishHTML([
          allowMissing: true,
          alwaysLinkToLastBuild: true,
          keepAll: true,
          reportDir: 'output',
          reportFiles: "report_${DESTINATION_NAME}_${DESTINATION_OS}.html",
          reportName: "Report ${DESTINATION_NAME} ${DESTINATION_OS}"
        ])
        publishHTML([
          allowMissing: true,
          alwaysLinkToLastBuild: true,
          keepAll: true,
          reportDir: 'output',
          reportFiles: "index_${DESTINATION_NAME}_${DESTINATION_OS}.html",
          reportName: "Golden Rose ${DESTINATION_NAME} ${DESTINATION_OS}"
        ])
      }
    }
  }
}

// UI Test branch
def uiTestBranch(scheme, platform, deviceName, deviceOS, unlockDanger=null) {
  ios.runOniOSNode(nodeName: "ios_ui", timeoutMin: 45, runBlock: {
    try {
      prepareStage()
      testStage(scheme, platform, deviceName, deviceOS)
    } finally {
      if (unlockDanger) {
        unlockDanger() {
          stage("Danger") {
            sh '''
              # Danger
              bundle exec danger
            '''
          }
        }
      }
    }
  })
}

// CocoaPods lint branch
def podLintBranch() {
  ios.runOniOSNode(runBlock: {
    prepareStage()
    stage("CocoaPods lint") {
      sh '''
        bundle exec pod lib lint
      '''
    }
  })
}

// Carthage lint branch
def carthageLintBranch() {
  ios.runOniOSNode(runBlock: {
    prepareStage()
    stage("Carthage lint") {
      sh '''
        carthage build --no-skip-current
      '''
    }
  })
}

// Branches
def branches(unlockDanger) {
  return [
    "iPhone SE, 11.1": {
      uiTestBranch("AutoMate", "iOS Simulator", "iPhone SE", "11.1")
    },
    "iPhone 8, 11.1": {
      uiTestBranch("AutoMate", "iOS Simulator", "iPhone 8", "11.1")
    },
    "iPhone 8 Plus, 11.1": {
      uiTestBranch("AutoMate", "iOS Simulator", "iPhone 8 Plus", "11.1")
    },
    "iPhone X, 11.1": {
      uiTestBranch("AutoMate", "iOS Simulator", "iPhone X", "11.1", unlockDanger)
    },
    "iPad Air 2, 11.1": {
      uiTestBranch("AutoMate", "iOS Simulator", "iPad Air 2", "11.1")
    },
    "iPad Pro (9.7-inch), 11.1": {
      uiTestBranch("AutoMate", "iOS Simulator", "iPad Pro (9.7-inch)", "11.1")
    },
    "iPad Pro (10.5-inch), 11.1": {
      uiTestBranch("AutoMate", "iOS Simulator", "iPad Pro (10.5-inch)", "11.1")
    },
    "iPad Pro (12.9-inch) (2nd generation), 11.1": {
      uiTestBranch("AutoMate", "iOS Simulator", "iPad Pro (12.9-inch) (2nd generation)", "11.1")
    },
    "CocoaPods lint": {
      podLintBranch()
    },
    "Carthage lint": {
      carthageLintBranch()
    }
  ]
}

// Parallel execution
parallel branches(unlockDangerCredentials)
