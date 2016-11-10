
ata "template_file" "instructor_init" {
  template = "${file("cloudinit.sh.tpl")}"
}

resource "aws_instance" "instructor" {
    ami = "${data.aws_ami.ubuntu.id}"
    key_name = "docker-training"
    instance_type = "m3.medium"
    tags {
        Name = "Docker training - instructor - ${var.instructor}"
        Group = "docker-training"
        Owner = "${var.instructor}"
    }
    user_data = "${data.template_file.student_init.rendered}"
    root_block_device {
      volume_size = 20
    }
}
