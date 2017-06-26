// Prepare
// - update bundle
// - reset simulators
def prepare() {
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
def test(scheme, platform, deviceName, deviceOS) {
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

// Test stages
def stegeTests() {
  // Tests
  try {
    stage("iPhone SE, 10.3.1") {
      test("AutoMate iOS", "iOS Simulator", "iPhone SE", "10.3.1")
    }

    stage("iPhone 7, 10.3.1") {
      test("AutoMate iOS", "iOS Simulator", "iPhone 7", "10.3.1")
    }

    stage("iPhone 7 Plus, 10.3.1") {
      test("AutoMate iOS", "iOS Simulator", "iPhone 7 Plus", "10.3.1")
    }

    stage("CocoaPods lint") {
      sh '''
        bundle exec pod lib lint
      '''
    }

    stage("Carthage lint") {
      sh '''
        carthage build --no-skip-current
      '''
    }
  }
  finally {
    stage("Danger") {
      sh '''
        # Danger
        bundle exec danger
      '''
    }

    stage("Clean") {
      deleteDir()
    }
  }
}

return this
