ios.prepareEnv(xcode: "/Applications/Xcode_8.3.app")

node("ios_ui") {
  timeout(45) {
    ansiColor('xterm') {

      // Perform tests
      def test = { deviceName, deviceOS ->
        withEnv(["DESTINATION_NAME=${deviceName}", "DESTINATION_OS=${deviceOS}"]) {
          ios.cleanBuild()
          ios.killSimulator()

          try {
            sh '''
              bundle exec fastlane test "destination:platform=iOS Simulator,name=${DESTINATION_NAME},OS=${DESTINATION_OS}"
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

      // Unlock Bitbucket Server credentials
      withCredentials([usernamePassword(credentialsId: 'pgs-software-bitbucket-server-danger_user', passwordVariable: 'DANGER_BITBUCKETSERVER_PASSWORD', usernameVariable: 'DANGER_BITBUCKETSERVER_USERNAME')]) {
        //
        // Stages
        // Prepare node
        // - clean workspace
        // - kill simulator
        // - clone repository
        // - update bundle
        // - reset simulators
        stage("Prepare & clone") {
          deleteDir()
          ios.killSimulator()
          checkout scm

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

        // Tests
        try {
          stage("iPhone SE, 10.3.1") {
            test("iPhone SE", "10.3.1")
          }

          stage("iPhone 7, 10.3.1") {
            test("iPhone 7", "10.3.1")
          }

          stage("iPhone 7 Plus, 10.3.1") {
            test("iPhone 7 Plus", "10.3.1")
          }

          stage("CocoaPods lint") {
            sh '''
              bundle exec pod lib lint
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
    }
  }
}
