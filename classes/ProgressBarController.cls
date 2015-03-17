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
