package cruiserdriver

import (
	"fmt"
	"os/exec"
	"github.com/golang/glog"
)

func TurnON() {
	glog.Info("turn on device")
	command := `cruiser-lib/hover.py`
	cmd := exec.Command("python3", command)

	output, err := cmd.Output()
	glog.Info("command:", command)
	glog.Info("output:", string(output))

	if err != nil {
		glog.Info("execute error:", err.Error())
		fmt.Printf("Execute :%s failed with error:%s", command, err.Error())
		return
	}
	fmt.Printf("Execute :%s finished with output:\n%s", command, string(output))
}

func TurnOff() {
}
