/*#########################################################################
# File..................: ProgressBarController
# API Version...........: 33.0
# Created by............: VB Cloud Symphony Dev
# Created Date..........: 03/17/2014
# Last Modified by......: VB Cloud Symphony Dev
# Last Modified Date....: 03/17/2014
# Description...........: Controller class for ProgressBar.component
#
# Copyright (c) 2015. CloudSymphony Limited. All Rights Reserved.
#
# Contact address: 25.-29 Queen Street, Maidenhead, SL6 1HY, UK
# Company URL : http://www.CloudSymphony.co.uk
###########################################################################*/
public class ProgressBarController {

	public String fieldValue {get;set;}
	public String fieldName {get;set;}

	public List<String> activeLabels {
		get {
			if (activeLabels == null) {
				activeLabels = new List<String>();
				Boolean meetValue = false;
				
				List<String> fieldNameSplit = fieldName.split('\\.');
				
				Schema.DescribeFieldResult picklistFieldDescription =
	              Schema.getGlobalDescribe().get(fieldNameSplit[0])
	              .getDescribe().fields.getMap()
	              .get(fieldNameSplit[1]).getDescribe();

	            for (Schema.Picklistentry picklistEntry : picklistFieldDescription.getPicklistValues()) {
	            	if (meetValue == false && fieldValue != null) {
	            		activeLabels.add(pickListEntry.getLabel());
	            	}
	            	if (fieldValue == pickListEntry.getValue()) {
	            		meetValue = true;
	            	}
	            }
			}
			return activeLabels;
		}
		private set;
	}
	
	public List<String> inactiveLabels {
		get {
			if (inactiveLabels == null) {
				inactiveLabels = new List<String>();
				Boolean meetValue = false;
				
				List<String> fieldNameSplit = fieldName.split('\\.');
			
				Schema.DescribeFieldResult picklistFieldDescription =
	              Schema.getGlobalDescribe().get(fieldNameSplit[0])
	              .getDescribe().fields.getMap()
	              .get(fieldNameSplit[1]).getDescribe();

	            for (Schema.Picklistentry picklistEntry : picklistFieldDescription.getPicklistValues()) {
	            	if (meetValue == true || fieldValue == null) {
	            		inactiveLabels.add(pickListEntry.getLabel());
	            	}
	            	if (fieldValue == pickListEntry.getValue()) {
	            		meetValue = true;
	            	}
	            }
			}
			return inactiveLabels;
		}
		private set;
	}
}