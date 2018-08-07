# ml-bhim-pipeline
User Manual for Bhim Pipeline

Before installing, here are a couple of things to note:

Make sure the RAM that Docker has available is set to 5 GB or more. This can be configured in the Docker GUI.
Before pulling, increase RAM available to Docker to 5 GB
Make sure computer doesn’t fall asleep during process - slows downloads
Set volume for data directory `-v /my/data/dir:/pipeline/datadir`
	- don’t need to specify volume in Dockerfile, can do @ runtime
	- output data will go to same volume folder, user can access outputs locally
	- MUST SPECIFY VOLUME AS FULL PATH, NOT LOCAL PATH
Proper format for data directory:
	- Contains folders labeled by SUBJECT name
	- Each folder contains only 1 BOLD file: /sub01/bold.nii.gz
To run the script: use tcsh to call the run.test script, feed it subject name
	- Example usage: `tcsh run.test subject`
	- Results are outputted to subject/subject.results folder locally
