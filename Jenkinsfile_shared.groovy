// Prepare
// - update bundle
// - reset simulators
def prepareStage() {
  stage("Prepare") {
    sh '''
      # Bundler
      bundle install
      bundle exec fastlane install_plugins

      # Reset simulators
      bundle exec fastlane snapshot reset_simulators --force --ios 10.3

      # Install dependnecies
      bundle exec fastlane prepare
    '''
  }
}

// Perform tests
def testStage(scheme, platform, deviceName, deviceOS) {
  stage("${deviceName} ${deviceOS}") {
    withEnv(["SCHEME=${scheme}", "PLATFORM=${platform}", "DESTINATION_NAME=${deviceName}", "DESTINATION_OS=${deviceOS}"]) {
      ios.cleanBuild()
      ios.killSimulator()

      try {
        sh '''
          bundle exec fastlane test "scheme:${SCHEME}" "destination:platform=${PLATFORM},name=${DESTINATION_NAME},OS=${DESTINATION_OS}"
        '''
      }
      finally {
        try {
          sh '''
            # bundle exec danger

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

// Run on node
def runNode(nodeName, block) {
  node(nodeName) {
    timeout(20) {
      ansiColor('xterm') {
        stage("Clone") {
          deleteDir()
          ios.killSimulator()
          checkout scm
        }

        prepareStage()

        // Run closure
        try {
          block()
        } finally {
          stage("Clean") {
            deleteDir()
          }
        }
      }
    }
  }
}

// UI Test branch
def uiTestBranch(scheme, platform, deviceName, deviceOS, unlockDanger=null) {
  runNode("ios_ui") {
    try {
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
  }
}

// CocoaPods lint branch
def podLintBranch() {
  runNode("ios") {
    stage("CocoaPods lint") {
      sh '''
        bundle exec pod lib lint
      '''
    }
  }
}

// Carthage lint branch
def carthageLintBranch() {
  runNode("ios") {
    stage("Carthage lint") {
      sh '''
        carthage build --no-skip-current
      '''
    }
  }
}

// Branches
def branches(unlockDanger) {
  return [
    "iPhone SE, 10.3.1": {
      uiTestBranch("AutoMate iOS", "iOS Simulator", "iPhone 7 Plus", "10.3.1")
    },
    "iPhone 7, 10.3.1": {
      uiTestBranch("AutoMate iOS", "iOS Simulator", "iPhone 7", "10.3.1", unlockDanger)
    },
    "iPhone 7 Plus, 10.3.1": {
      uiTestBranch("AutoMate iOS", "iOS Simulator", "iPhone 7 Plus", "10.3.1")
    },
    "CocoaPods lint": {
      podLintBranch()
    },
    "Carthage lint": {
      carthageLintBranch()
    }
  ]
}

return this
