## ml-bhim-pipeline

User Manual for Morey Lab (ML) - Bhim Pipeline

# Things to Note Pre-Installation
1. Go to your Docker desktop application and make sure the available RAM for Docker is set to **5 GB or more**. *The additional RAM is necessary for the MRtrix3 installation.*

2. The file is large and the download process takes a while. Please ensure that your computer doesn’t fall asleep during the process. If your computer falls asleep, certain large downloads may time out, causing the whole installation to fail

3. To download the image from Docker, use the command `docker pull arnavpon/moreylab-bhim-pipeline`

# Image Usage (Post-Installation)
1. Run the image with the command `docker run -it -v /my/data/directory:/pipeline/datadir ml-bhim-pipeline`

2. The option + argument `-v /my/data/dir:/pipeline/datadir` creates a link between a **local** directory and a location on the image (`/pipeline/datadir`). Make sure that your fMRI data is present on this local directory, and in the specified format (*see step 3*). You **MUST** specify your local data directory **AS A FULL PATH**, **not** a relative path! The pre-processing outputs will be present **inside** the folder for the subject whose data was used for pre-processing. When you terminate the container, this data *will still exist* so you can access it at your leisure.

3. **Local Data Directory Format**: your directory should contain **1 sub-folder _per subject_** for each subject with associated fMRI data. Within each subfolder, there should be a `/subject_name/bold.nii.gz` file. Please make sure the file is named `bold.nii.gz` or the system won't be able to locate it.

4. To perform pre-processing, type `tcsh run.test subject` into the container command line, substituting the name of the subject's associated folder for `subject` (the argument must match the folder name **exactly**). All results of pre-processing will be written to a `subject.results` folder inside the subject's folder. This folder will show up on your local machine, and persists after terminating the container.
