ios.prepareEnv(xcode: "/Applications/Xcode_9.1.app")

def shared
node("linux&&docker_container&&linux_core") {
  timeout(5) {
    checkout scm
    shared = load 'Jenkinsfile_shared.groovy'
  }
}

// Unlock Bitbucket Server credentials for Danger
def unlockDangerCredentials(block) {
  withCredentials([usernamePassword(credentialsId: 'pgs-software-bitbucket-server-danger_user', passwordVariable: 'DANGER_BITBUCKETSERVER_PASSWORD', usernameVariable: 'DANGER_BITBUCKETSERVER_USERNAME')]) {
    block()
  }
}

// Parallel execution
parallel shared.branches(this.&unlockDangerCredentials)
