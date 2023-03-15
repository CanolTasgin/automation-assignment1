terraform {
  backend "azurerm" {
    resource_group_name  = "tfstateN01510487RG"
    storage_account_name = "tfstaten01510487sa"
    container_name       = "tfstatefiles"
    key                  = "terraform.tfstate"

    access_key = "mQJ3pPwvD+t7ELQ0U77CzEQVDGyH++1PA27dGsf+6KHSt+xFyndnRaqpxyPc7+jEoJzm88nGp5Zy+AStTCp9nA=="
  }
}
