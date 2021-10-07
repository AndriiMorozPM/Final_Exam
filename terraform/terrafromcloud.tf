terraform {
  backend "remote" {
    organization = "andrii-comp"

    workspaces {
      name = "Final_Exam"
    }
  }
}