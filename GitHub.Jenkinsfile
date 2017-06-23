ios.prepareEnv(xcode: "/Applications/Xcode_8.3.app", danger_bitbucket: null)

node("ios_ui") {
  timeout(60) {
    ansiColor('xterm') {

      // Unlock Bitbucket Server credentials
      withCredentials([usernamePassword(credentialsId: 'pgs-github-PGSJenkins-token', passwordVariable: 'DANGER_GITHUB_API_TOKEN', usernameVariable: '')]) {
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
