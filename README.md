## Docker: Rundeck master-slave
### How to use
#### 1. git clone
#### 2. Build the docker image
```
docker-rundeck

./build.sh

docker-rundeck-slave

./build.sh 
```
#### 3. Start container

For local run, please import manually the ansible job from the jobs directory. (please hardcode your etc/hosts  for local use)
```
 docker-compose up
```
##### In normal use, a job can be imported from a GIT repository because there is the GIT SCM plugin already installed. 

##### The slave-container is being automatically spined up and destroyed after the execution. 
##### In the jobs directory, there is a job definition of an ansible-playbook execution, based on ansible 2.8 

##### Don't forget to replace in rundeck_ansible_job.yaml, the "blabla" stuff with real configuration items.  

Credits: I've forked out @hbjcr's project and worked on top of that. 
