ios.prepareEnv(xcode: "/Applications/Xcode_8.3.app")

node("ios_ui") {
  timeout(60) {
    ansiColor('xterm') {

      // Unlock Bitbucket Server credentials
      withCredentials([usernamePassword(credentialsId: 'pgs-software-bitbucket-server-danger_user', passwordVariable: 'DANGER_BITBUCKETSERVER_PASSWORD', usernameVariable: 'DANGER_BITBUCKETSERVER_USERNAME')]) {
        //
        // Stages
        // Prepare node
        // - clean workspace
        // - kill simulator
        // - clone repository
        stage("Clone") {
          deleteDir()
          ios.killSimulator()
          checkout scm
        }

        def shared = load 'Jenkinsfile_shared.groovy'
        shared.prepare()
        shared.stegeTests()
      }
    }
  }
}
