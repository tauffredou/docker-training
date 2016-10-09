
data "template_file" "student_init" {
  count = "${length(var.students)}"
  template = "${file("cloudinit.sh.tpl")}"
  vars {
    email = "${element(var.students,count.index)}"
  }
}

resource "aws_instance" "student" {
    count = "${length(var.students)}"
    ami = "${data.aws_ami.ubuntu.id}"
    key_name = "201603-docker"
    /*ami = "ami-87564feb"*/
    instance_type = "m3.large"
    tags {
        Name = "docker-training-student#${count.index +1}"
        Group = "docker-training"
        Owner = "${var.instructor}"
        Student = "${element(var.students,count.index)}"
    }
    user_data = "${element(data.template_file.student_init.*.rendered, count.index)}"
    root_block_device {
      volume_size = 20
    }
}
