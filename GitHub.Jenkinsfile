ios.prepareEnv(xcode: "/Applications/Xcode_9.1.app", danger_bitbucket: null)

def shared
node("linux&&docker_container&&linux_core") {
  timeout(5) {
    checkout scm
    shared = load 'Jenkinsfile_shared.groovy'
  }
}

// Unlock Bitbucket Server credentials for Danger
def unlockDangerCredentials(block) {
  withCredentials([usernamePassword(credentialsId: 'pgs-github-PGSJenkins-token', passwordVariable: 'DANGER_GITHUB_API_TOKEN', usernameVariable: '')]) {
    block()
  }
}

// Parallel execution
parallel shared.branches(this.&unlockDangerCredentials)
