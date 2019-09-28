package com.aws.poc.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonAutoDetect.Visibility;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonAutoDetect(fieldVisibility = Visibility.ANY, getterVisibility = Visibility.NONE, setterVisibility = Visibility.NONE)
public class ResponseData {

	@JsonProperty(value="api_version")
	private String InstanceId;
	
	@JsonProperty(value="message")
	private String CpuUtilization;
	
	@JsonProperty(value="date")
	private String publicIpAddress;
	@JsonIgnore
	private int httpStatus;
	
}
