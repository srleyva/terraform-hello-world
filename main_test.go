package test

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	"testing"
)

func TestHelloWorld(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "./",
		Vars: map[string]interface{}{
			"GOOGLE_COMPUTE_ZONE": "us-east1-a",
			"GOOGLE_PROJECT_ID":   "nifi-staq-test",
		},
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	actualText := terraform.Output(t, terraformOptions, "bucket_url")
	if actualText != "gs://my-sleyva-test-bucket" {
		t.Errorf("Bucket URL incorrect: \n Actual: %s Expected: %s", actualText, "gs://my-sleyva-test-bucket")
	}

}
