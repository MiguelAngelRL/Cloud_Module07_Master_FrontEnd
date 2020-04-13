provider "aws"{
	region="us-east-2"
}

data "template_file" "start_script" {
	template="${file("./script.sh")}"
}

resource "aws_security_group" "cloud_exercise_sg" {
	name="server_security_group"
	ingress {
		from_port=22
		to_port=22
		protocol="tcp"
		cidr_blocks=["0.0.0.0/0"]
	}
	ingress {
		from_port=80
		to_port=80
		protocol="tcp"
		cidr_blocks=["0.0.0.0/0"]
	}
	egress {
		from_port=0
		to_port=0
		protocol=-1
		cidr_blocks=["0.0.0.0/0"]
	}
	lifecycle {
		create_before_destroy=true
	}
}

resource "aws_instance" "cloud_exercise"{
	ami="ami-097834fcb3081f51a"
	instance_type="t2.micro"
	vpc_security_group_ids=[aws_security_group.cloud_exercise_sg.id]
	key_name="cloud_exercise"
	user_data=data.template_file.start_script.rendered
}

output "my_server_ip" {
	value=aws_instance.cloud_exercise.public_ip	
}


