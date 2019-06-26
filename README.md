# Cruiser
 
## Description
 
## Prerequisites 

### Hardware Prerequisites

1. RaspBerry-Pi
2. Crazyflie 2.0

### Software Prerequisites
 
1. Golang
2. KubeEdge

## Steps to reproduce

1. Assemble RaspBerry-Pi and Crazyflie 2.0

2. Clone and run KubeEdge. 
    Click [KubeEdge Usage](https://github.com/kubeedge/kubeedge/blob/master/docs/getting-started/usage.md) for instructions
    Ensure that the kubeedge is running

3. Clone the kubeedge/examples repository.

       ```shell
                   git clone https://github.com/cfreebuf/kubeedge-examples.git $GOPATH/src/github.com/kubeedge-examples/kubeedge-examples
       ```

4. Create the PI device model and device instance.

       ```shell
                   cd $GOPATH/src/github.com/kubeedge/examples/cruiser/sample-crds
                   kubectl apply -f cruiser-device-model.yaml
                   kubectl apply -f cruiser-device-instance.yaml

                   Note: You can change the CRDs to match your requirement
        ```

 5. Update the name of the device instance name created using the device CRD
 
 6. Build the mapper to run in RaspBerry-Pi.

    ```shell         
                cd $GOPATH/src/github.com/kubeedge/examples/cruiser/
                make # or `make cruiser`
                docker tag cruiser:v1.0 <your_dockerhub_username>/cruiser:v1.0
                docker push <your_dockerhub_username>/cruiser:v1.0
    ```
 
 7. Deploy the cruiser.
        
    ```shell
                cd $GOPATH/src/github.com/kubeedge/examples/cruiser/

                # edit deployment.yaml :-
                #    1. Replace <edge_node_name> with the name of your edge node at spec.template.spec.voluems.configMap.name
                #    2. Replace <your_dockerhub_username> with your dockerhub username at spec.template.spec.containers.image

                kubectl create -f deployment.yaml
     ```
 
  8. Change the device Twin attribute (expected value) "power-state"
