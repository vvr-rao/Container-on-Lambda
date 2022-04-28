({
	doInit : function(component, event, helper) {
		
        var action = component.get("c.serverEcho");
        
        action.setParams({ recordId : component.get("v.recordId") });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                //alert("From server: " + response.getReturnValue());
                window.setTimeout(
 				 	$A.getCallback(function() {
                 		//$A.get("e.force:closeQuickAction").fire(); 
    			 		//$A.get('e.force:refreshView').fire();                 
  				 		}), 
                    500); // Wait
                $A.get("e.force:closeQuickAction").fire(); 
                $A.get('e.force:refreshView').fire();
            }
            else {
                alert("Some Error!!")
            }
        });
        
        $A.enqueueAction(action);
        //eval("$A.get('e.force:refreshView').fire();")
        
        // Close the action pane
        
        //$A.get("e.force:closeQuickAction").fire(); 
        //$A.get("e.force:refreshView").fire();
	}
})
