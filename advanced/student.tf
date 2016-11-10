
data "template_file" "student_init" {
  count = "${length(var.students)}"
  template = "${file("cloudinit.sh.tpl")}"
  vars {
    email = "${element(var.students,count.index)}"
  }
}

resource "aws_instance" "master" {
    count = "${length(var.students)}"
    ami = "${data.aws_ami.ubuntu.id}"
    key_name = "201603-docker"
    instance_type = "m3.medium"
    tags {
        Name = "Docker advanced - ${element(var.students,count.index)} - master"
        Group = "docker-training"
        Owner = "${var.instructor}"
        Student = "${element(var.students,count.index)}"
    }
    user_data = "${element(data.template_file.student_init.*.rendered, count.index)}"
    root_block_device {
      volume_size = 20
    }
}

resource "aws_instance" "node1" {
  count = "${length(var.students)}"
  ami = "${data.aws_ami.ubuntu.id}"
  key_name = "201603-docker"
  instance_type = "m3.medium"
  tags {
    Name = "Docker advanced - ${element(var.students,count.index)} - node1"
    Group = "docker-training"
    Owner = "${var.instructor}"
    Student = "${element(var.students,count.index)}"
  }
  user_data = "${element(data.template_file.student_init.*.rendered, count.index)}"
  root_block_device {
    volume_size = 20
  }
}

resource "aws_instance" "node2" {
  count = "${length(var.students)}"
  ami = "${data.aws_ami.ubuntu.id}"
  key_name = "201603-docker"
  instance_type = "m3.medium"
  tags {
    Name = "Docker advanced - ${element(var.students,count.index)} - node2"
    Group = "docker-training"
    Owner = "${var.instructor}"
    Student = "${element(var.students,count.index)}"
  }
  user_data = "${element(data.template_file.student_init.*.rendered, count.index)}"
  root_block_device {
    volume_size = 20
  }
}

resource "aws_instance" "node3" {
  count = "${length(var.students)}"
  ami = "${data.aws_ami.ubuntu.id}"
  key_name = "201603-docker"
  instance_type = "m3.medium"
  tags {
    Name = "Docker advanced - ${element(var.students,count.index)} - node3"
    Group = "docker-training"
    Owner = "${var.instructor}"
    Student = "${element(var.students,count.index)}"
  }
  user_data = "${element(data.template_file.student_init.*.rendered, count.index)}"
  root_block_device {
    volume_size = 20
  }
}