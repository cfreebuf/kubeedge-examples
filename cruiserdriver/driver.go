package cruiserdriver

import (
	"fmt"
	"os/exec"
)

func TurnON() {
	command := `cruiser-lib/hover.py`
	cmd := exec.Command("python3", command)

	output, err := cmd.Output()
	if err != nil {
		fmt.Printf("Execute :%s failed with error:%s", command, err.Error())
		return
	}
	fmt.Printf("Execute :%s finished with output:\n%s", command, string(output))
}

func TurnOff() {
}
