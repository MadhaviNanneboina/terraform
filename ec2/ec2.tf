resource "aws_instance" "db" {
    ami = "ami-090252cbe067a9e58"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = "t3.micro"

    tags = {
        Name = "db"
    
    }
}



#resouce <resource type> "resource name" we cannot change resource type
resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "Allowing ssh access"

    tags = {
        Name = "allow_ssh"
        createdBy = "madhavidasri"

    }
    
    #we can restrict inbound as per now we are allowing only ssh protocals so we have to mention ssh
    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"    #internet works on tcp protocal
        cidr_blocks      = ["0.0.0.0/0"]
        
    }

    egress {
        from_port        = 0                #fromport 0 and to port 0 open for all protocalls(means allow everything)
        to_port          = 0
        protocol         = "-1"              #-1 means all protocols
        cidr_blocks      = ["0.0.0.0/0"]
        
    }
}
    #oubout eppudu allow evrything vundali


