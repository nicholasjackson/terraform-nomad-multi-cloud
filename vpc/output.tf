output "vpc_id" {
  value = "${aws_vpc.default.id}"
}

output "vpc_subnet" {
  value = ["${aws_subnet.default.*.id}"]
}
