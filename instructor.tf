
data "template_file" "instructor_init" {
  template = "${file("cloudinit.sh.tpl")}"
  vars {
    email = "${var.instructor}"
  }
}

resource "aws_instance" "instructor" {
    key_name = "201603-docker"
    ami = "${data.aws_ami.ubuntu.id}"
    instance_type = "m3.large"
    tags {
        Name = "docker-training-instructor"
        Group = "docker-training"
        Owner = "${var.instructor}"
    }
    user_data = "${data.template_file.instructor_init.rendered}"
    root_block_device {
      volume_size = 20
    }

}
