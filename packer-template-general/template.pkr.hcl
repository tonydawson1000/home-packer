source "type" "name" {

}

build {
  sources = ["source.type.name"]
}


# name = "my-random-${uuidv4()}"

# check the 'exit code' after running (validate) command
  # echo $?
  # should be zero (0) = success

# packer build -debug .
  # pauses after every command execution

