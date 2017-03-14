node("ios_ui") {
  timeout(45) {
    ansiColor('xterm') {
      env.LANG = "en_US.UTF-8"
      env.RBENV_VERSION = env.RBENV_2_4
      env.NSUnbufferedIO = "YES"
      env.DEVELOPER_DIR = "/Applications/Xcode.app"
      env.DANGER_BITBUCKETSERVER_HOST = "bitbucket.pgs-soft.com"

      //
      // Helper methods
      // Clean output and derivedData folders
      def cleanBuild = {
        sh '''
          rm -r output || true
          rm -r derivedData || true
        '''
      }

      // Kill simulator
      def killSimulator = {
        sh '''
          # Kill iOS Simulator
          killall -9 -u $(id -un) "Simulator" || true
          killall -9 -u $(id -un) "launchd_sim" || true
          killall -9 -u $(id -un) "com.apple.CoreSimulator.CoreSimulatorService" || true
          ps -u $(id -un) -o pid,comm | grep Xcode\\.app | awk '{print $1}' | xargs kill -9
        '''
      }

      // Perform tests
      def test = { deviceName, deviceOS ->
        withEnv(["DESTINATION_NAME=${deviceName}", "DESTINATION_OS=${deviceOS}"]) {
          cleanBuild()
          killSimulator()

          try {
            sh '''
              # RBENV
              eval "$(rbenv init -)"

              bundle exec fastlane test "destination:platform=iOS Simulator,name=${DESTINATION_NAME},OS=${DESTINATION_OS}"
            '''
          }
          finally {
            try {
              sh '''
                # RBENV
                eval "$(rbenv init -)"

                # bundle exec danger

                bundle exec golden_rose generate "output/AutoMate.test_result"
                mv "index.html" "output/index_${DESTINATION_NAME}_${DESTINATION_OS}.html" || true
                mv "output/report.html" "output/report_${DESTINATION_NAME}_${DESTINATION_OS}.html" || true
              '''
            } finally {}
            archiveArtifacts allowEmptyArchive: true, artifacts: 'output/*.html,derivedData/Logs/Test/**/*.log'
            junit allowEmptyResults: true, testResults: 'fastlane/report.xml,output/report.junit'
            sh '''
              rm -rf "output/"*.result || true
              rm -rf "output/"*.test_result || true
            '''
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
          killSimulator()
          checkout scm

          sh '''
            # RBENV
            eval "$(rbenv init -)"

            # Bundler
            bundle install
            bundle exec fastlane install_plugins

            # Reset simulators
            bundle exec fastlane snapshot reset_simulators --force --ios 10.2

            # Install dependnecies
            bundle exec fastlane prepare
          '''
        }

        // Tests
        try {
          stage("iPhone SE, 10.2") {
            test("iPhone SE", "10.2")
          }

          stage("iPhone 7, 10.2") {
            test("iPhone 7", "10.2")
          }

          stage("iPhone 7 Plus, 10.2") {
            test("iPhone 7 Plus", "10.2")
          }

          stage("CocoaPods lint") {
            sh '''
              # RBENV
              eval "$(rbenv init -)"

              bundle exec pod lib lint
            '''
          }
        }
        finally {
          stage("Danger") {
            sh '''
              # RBENV
              eval "$(rbenv init -)"

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
