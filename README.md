# Go1-Webots-Docker
Creates a Docker to run the Unitree-Go1 robot within a Webots simulator.

> [!IMPORTANT]
> The Webots simulator only has support for AMD chips. Even if using a VM, you will not be able to run this on a machine with an ARM processor.

> [!NOTE]
> This docker currently is only capable of running up any tutorial / pre-defined Webots simulations. Support for the Unitree Go1 robot has not been added.

## Table of Contents
- [Contributors](#contributors)
- [Usage](#usage)

## Contributors
Created by [Shaun Altmann](https://github.com/ShaunAlt).

## Usage
1. Install Docker. This repository requires the use of Docker. A full set of instructions for setting up Docker on your VM can be found [here](https://github.com/ShaunAlt-Unitree-Go1#installing-docker).
2. Clone this Repository
    ``` bash
    $ cd ~/
    $ git clone https://github.com/ShaunAlt-Unitree-Go1/Go1-Webots-Docker.git
    ```
3. Build the Docker Image
    ``` bash
    $ cd ~/Go1-Webots-Docker/
    $ ./docker/build_docker.bash
    ```
4. Run the Docker Image
    ``` bash
    $ cd ~/Go1-Webots-Docker/
    $ ./docker/run_docker.bash # use the `-h` option to see more information about this command
5. Run the Webots Simulator
    ``` bash
    # inside the docker
    $ webots
    ```
