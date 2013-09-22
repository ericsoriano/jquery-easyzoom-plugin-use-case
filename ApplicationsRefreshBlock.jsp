<?xml version="1.0" encoding="ISO-8859-1" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">  
 
<%@ include file="../../../includes/environmentSetup.jspf" %>

	<script type="text/javascript">
		jQuery(function($){
			$('a.zoom').easyZoom({
				id: 'zoomFromProductList'
			});
		});
	</script>	

<c:choose>
	<c:when test="${!empty WCParam.partTermId}">
		<wcbase:useBean id="applicationBean" classname="com.imcparts.wc.catalog.databean.MutilpleApplicationPartsDetailDataBean" scope="page" >    
			<c:set value="${WCParam.baseVID}" target="${applicationBean}" property="baseVID"/> 
			<c:set value="${WCParam.partTermId}" target="${applicationBean}" property="partTermId" />
			<c:set value="${WCParam.submodel}" target="${applicationBean}" property="submodel" />
			<c:set value="${WCParam.cylinders}" target="${applicationBean}" property="cylinders" />
			<c:set value="${WCParam.fuelTypeName}" target="${applicationBean}" property="fuelTypeName" />
			<c:set value="${WCParam.engine}" target="${applicationBean}" property="engineDesignation" />
			<c:set value="${WCParam.liters}" target="${applicationBean}" property="liters" />
			<c:set value="${WCParam.aspiration}" target="${applicationBean}" property="aspiration" />
			<c:set value="${WCParam.headType}" target="${applicationBean}" property="headType" />
			<c:set value="${WCParam.bodyType}" target="${applicationBean}" property="bodyType" />
			<c:set value="${WCParam.chassisCode}" target="${applicationBean}" property="chassisCode" />
			<c:set value="${WCParam.driveType}" target="${applicationBean}" property="driveType" />
			<c:set value="${WCParam.advFilter}" target="${applicationBean}" property="advFilter" />
		</wcbase:useBean>
		<c:set var="applicationPartsList" value="${applicationBean.applicationPartsList}" />
		<c:set var="originalAppCount" value="${applicationBean.originalAppCount}" />
		<c:set var="partTermName" value="${WCParam.partTermName}" />
	</c:when>
	<c:otherwise>
		<wcbase:useBean id="carRepairJobsBean" classname="com.imcparts.wc.catalog.databean.CarRepairJobsDataBean" scope="page" >    
			<c:set value="${WCParam.baseVID}" target="${carRepairJobsBean}" property="baseVID"/> 
			<c:set value="${WCParam.jobId}" target="${carRepairJobsBean}" property="carRepairJobId"/> 
			<c:set value="${WCParam.submodel}" target="${carRepairJobsBean}" property="submodel"/> 
			<c:set value="${WCParam.cylinders}" target="${carRepairJobsBean}" property="cylinders"/> 
			<c:set value="${WCParam.fuelTypeName}" target="${carRepairJobsBean}" property="fuelTypeName"/> 
			<c:set value="${WCParam.engine}" target="${carRepairJobsBean}" property="engineDesignation"/>
			<c:set value="${WCParam.liters}" target="${carRepairJobsBean}" property="liters"/> 
			<c:set value="${WCParam.aspiration}" target="${carRepairJobsBean}" property="aspiration" />
			<c:set value="${WCParam.headType}" target="${carRepairJobsBean}" property="headType" />
			<c:set value="${WCParam.bodyType}" target="${carRepairJobsBean}" property="bodyType" />
			<c:set value="${WCParam.chassisCode}" target="${carRepairJobsBean}" property="chassisCode" />
			<c:set value="${WCParam.driveType}" target="${carRepairJobsBean}" property="driveType" />
			<c:set value="${WCParam.advFilter}" target="${carRepairJobsBean}" property="advFilter" />
		</wcbase:useBean>
		<c:set var="applicationPartsList" value="${carRepairJobsBean.applicationPartsList}" />
		<c:set var="originalAppCount" value="${carRepairJobsBean.originalAppCount}" />
	</c:otherwise>
</c:choose>

<c:if test="${!empty WCParam.partTermId}">
	<wcbase:useBean id="catBCBean" classname="com.imcparts.wc.catalog.databean.CategoryBreadCrumbDataBean" scope="page" >    
		<c:set value="${WCParam.partTermId}" target="${catBCBean}" property="partTermId"/> 
	</wcbase:useBean>
	<c:set var="catBC" value="${catBCBean.categoryBreadCrumbBean}" />
	
	<ol style="display:none">
		<li title="<c:out value="${catBC.categoryBean.id}" />"><c:out value="${catBC.categoryBean.name}" /></li>
		<li title="<c:out value="${catBC.subCategoryBean.id}" />"><c:out value="${catBC.subCategoryBean.name}" /></li>
		<li title="<c:out value="${catBC.partTerminologyBean.id}" />"><c:out value="${catBC.partTerminologyBean.name}" /></li>
	</ol>
</c:if>

<dl style="display:none">
	<dt>TotalApps</dt><dd><c:out value="${originalAppCount}" /></dd>
</dl> -->

<%@ include file="applications.jspf" %>

<c:if test="${!empty WCParam.partTermId}">

	Capturing the first 5 part numbers 
	<c:set var="counter" value="0"/>
	<c:set var="riPartList" value=""/>
	<c:forEach var="appParts" items="${applicationPartsList}" varStatus="status">
		<c:if test="${not(empty appParts.partDetailBeanList || fn:length(appParts.partDetailBeanList) == 0)}">
			<c:set var="riPartDetailList" value="${appParts.partDetailBeanList}" />
			<c:forEach var="riPartDetailBean" items="${riPartDetailList}" >
				<c:set var="counter" value="${counter + 1}"/>
				<c:if test="${counter <= 5}">
					<c:choose>
					<c:when test="${ empty riPartList }">
						<c:set var="riPartList" value="${riPartDetailBean.unspacedPartNumber}"/>
					</c:when>
					<c:otherwise>
						<c:set var="riPartList" value="${riPartList},${riPartDetailBean.unspacedPartNumber}"/>
					</c:otherwise>
					</c:choose>
				</c:if>
			</c:forEach>
		</c:if>
	</c:forEach>
	
	Invoking the Related Items 
	<script>
		getRelatedItems('<c:out value="${riPartList}"/>', '<c:out value="${WCParam.baseVID}"/>');
//		dijit.byId("divRelatedItems").attr("href", 'AjaxRelatedItemsURL?partList=<c:out value="${riPartList}"/>&baseVID=<c:out value="${WCParam.baseVID}"/>');
//		showDiv("relatedItemsSection");
	</script>

</c:if>