<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html lang="en">
<head>

</head>

<script language="JavaScript">
	function setFocus() {
		try {
			document.inputForm.ticketNumber.focus();
		} catch (e) {
		}
	}
</script>

<body onload="javascript:setFocus();">
	<DIV id=pagebkg>
		<div class="user-login-5">
			<div class="page-content" style="background-color: #f5f3eb;">
				<table align="center">
					<tr>
						<td width="864" align="left">
							<!--<a href="http://www.metro.net" style="vertical-align: bottom">
<img src="/pbw/include/la_metro/images/mclogo.jpg" alt="Go to homepage" border="0"/>
</a>-->
							<div class="portlet-title">
								<table cellpadding="0" cellspacing="0">
									<tr>
										<td valign="middle" class="topHeading"><b>Tribunal de
												Transporte de Metro</b></td>
									</tr>
									<tr>
										<td valign="top"><a
											href="https://www.metro.net/about/transit-court/"><img
												width="600px"
												src=<c:url value='/static/img/TransitCourt2.jpg'/>
												alt="Go to homepage" border="0" /></a></td>
										<td>&nbsp;&nbsp;&nbsp;</td>
										<td valign="top">
											<div id="sideContent">
												<!-- <table class="contactHeader" width="300px" Height="25px"
										style="BACKGROUND: #EBC5FF;">
										<tr>
											<th align="left" class="bodySmall">&nbsp; Para Contactarnos
											<th>
										</tr>
									</table>
									<table width="300px" Height="128px" cellpadding="2"
										cellspacing="2">
										<tr>
											<td class="bodyXSmall"><b>Horas de Operacion: </b><br />
												Lunes a Jueves - 9 am - 3pm  <br /> Viernes - Cerrado <br /></td>
										</tr>
										<tr>
											<td></td>
										</tr>
										<tr>
											<td class="bodyXSmall"><b>Centro de Servicio al Cliente<br />
													213.92COURT &nbsp;&nbsp; (213.922.6878)<br /> 866.320.8807<br />
													Lunes a Viernes 8am - 5pm
											</b></td>
										</tr>
									</table> -->
												<div class="portlet box green bg-inverse" align="left">
													<div class="portlet-title"
														style="padding: 0 6px; margin-bottom: -3px; height: 27px; min-height: 10px;">
														<div class="caption"
															style="width: -10px; font-size: 14px; padding-top: 2px; padding-bottom: 1px;">
															<b>Para Contactarnos</b>
														</div>
													</div>
													<div class="portlet-body " style="padding: 6px;">
														<b>Horas de Operacion: </b><br /> Lunes a Jueves - 9 am -
														3pm <br /> Viernes - Cerrado<br /> <b>Centro de
															Servicio al Cliente<br /> 213.92COURT &nbsp;&nbsp;
															(213.922.6878)<br /> Lunes a Viernes 8am - 5pm
														</b>
													</div>
												</div>
											</div>
										</td>
									</tr>
								</table>
							</div>
							<table width="900">
								<tr>
									<td>
										<table width="72%" border="0" cellpadding="2" cellspacing="2">
										</table>
									</td>
								</tr>
								<tr>
									<td><font class="bodySmall"><b>Por favor
												verifique la siguente informacion.</b></font><br />
										<div class="row">
											<div class="col-md-6">
												<div>
													<input id="infoCorrect" type="checkbox" name="ticketInfo"
														value="yes"> <font color="#32c5d2"
														class="registerAns"><b>Si, �sta es la
															informaci�n correcta.</b></font>
												</div>
											</div>
											<div class="col-md-6" style="padding-right: 2px;">
												<div class="btn green btn-sm"
													style="width: 60px; float: right;">
													<a href="<c:url value='/consumerloginSpanish' />"
														style="text-decoration: none; color: #fff;">Espalda</a>
												</div>
											</div>
										</div> <span>&nbsp;<form:errors name="ticketInfo"
												cssClass="alert-danger" /> <span class="alert-danger"
											id="infoCorrectError"></span>
									</span></td>
									<td><font class="bodySmall"> <!-- -->
									</font></td>
								</tr>
								<tr>
									<td><font class="bodySmall"><b>Consultando
												documento: Infracci�n ${citationId}</b><br> Usted tiene un
											total de <b>1</b> infracci�n(es) en su cuenta.</font></td>
								</tr>
								<tr>
									<td width="100%" class="bodySmall" valign="top"><br>
									<b> </b> La cantidad de la infracci�n introducida es: <b>${consumer.penaltyAmt}</b><br>
										La cantidad total de su(s) infracci�n(es) es: <b>$</b><b>${consumer.totalDue}</b><br>
										<br>
									<b> Seleccione una de las siguientes opciones: </b></td>
								</tr>
								<tr>
									<td>
										<table width="72%" border="0" cellpadding="2" cellspacing="2">
											<tr>
												<td><input id="violationPay" type="radio"
													name="consumerdetails1" value="T1" /> <font
													class="bodySmall">Desear�a pagar �nicamente esta
														infracci�n.</font> <span>&nbsp;<form:errors
															name="consumerdetails1" cssClass="alert-danger" /> <span
														class="alert-danger" id="consumerdetails1Error"></span>
												</span></td>
										</table>
									</td>
								</tr>
								<tr>
									<td>

										<table style="margin-top: 25px;"
											class="table  table-bordered table-hover table-checkable order-column"
											id="sample_editable_1">
											<thead>
												<tr>
													<th width="14%"><u>N�mero deInfracci�n:</u></th>
													<th width="14%"><u>Fecha de<br />emisi�n
													</u></th>
													<th width="14%"><u>Violaci�n</u></th>
													<th width="14%"><u>Lugar</u></th>
													<th width="14%"><u>Cantidad</u></th>
												</tr>
												<tr>
													<td width="14%"><c:out value="${citationId}" /></td>
													<td width="14%"><c:out
															value="${consumer.dateOfViolation}" />&nbsp; <c:out
															value="${citationForm.timeofViolation}" /></td>
													<td width="14%"><c:out
															value="${consumer.citationType}" /></td>
													<td width="14%"><c:out value="${consumer.location}" /></td>
													<td width="14%">$<c:out value="${consumer.totalDue}" /></td>
												</tr>

											</thead>
										</table>
								<tr>
									<td colspan="5" align="right"><b><font
											class="bodySmall">Pago total:&nbsp;</font> <font
											class="bodySmall"><b>$</b>${consumer.totalDue}</font></b></td>
								</tr>
								<tr>
									<td>
										<div class="col-md-12">
											<div class="page-content">
												<!-- BEGIN PAGE HEADER-->
												<br />
												<!-- END PAGE HEADER-->
												<span id="showPayButton"> <c:if
														test="${consumer.status!='PAID' && consumer.status!='CLOSED' &&consumer.status!='VIOD' && consumer.status!='OVERPAID' && consumer.totalDue>0.00}">
                    &nbsp;<a
															href="${pageContext.request.contextPath}/consumerpayment"
															style="text-decoration: none; color: #fff;"><button
																type="button" class="btn green btn-sm"
																style="width: 150px;" id="checkpay">paga</button></a>
													</c:if>
												</span>

												<!-- <a href="javascript:void(0)"><button type="button"
														class="btn btn-primary btn-md" style="width: 200px;">Community
														Service</button></a> -->
												<c:if
													test="${transitSchool!='false' && consumer.status!='PAID' && consumer.status!='CLOSED' &&consumer.status!='VIOD' && consumer.status!='OVERPAID' && consumer.totalDue>0.00}">
													<a data-toggle="modal" href="#myModal"><button
															type="button" class="btn green btn-sm"
															style="width: 200px;">Tr�nsito Colegio</button></a>
												</c:if>
												<%-- <a href="${pageContext.request.contextPath}/consumercorrespondance/<%= session.getAttribute("citationId") %>"><button type="button" class="btn green btn-sm" style="width:200px;">Correspondencia</button></a> --%>
												<!-- <a href="javascript:void(0)"><button type="button" class="btn btn-primary btn-md" style="width:250px;">Change Hearing Time</button></a> -->
											</div>
										</div>
										<div class="modal" id="myModal" tabindex="-1" role="dialog"
											aria-labelledby="myModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<a href="#" class="close" data-dismiss="modal">&times;</a>
														<h4 class="modal-title" id="myModalLabel">
															<i class="text-muted fa fa-university"></i>Tr�nsito
															Colegio
														</h4>
													</div>
													<div class="modal-body">

														<table class="pull-left col-md-10"
															style="margin-left: 55px;">
															<tbody>
																<tr>
																	<td>&nbsp;</td>
																	<td>&nbsp;</td>
																</tr>
																<tr>
																	<td class="h6"><strong>�ltimo Nombre</strong></td>
																	<td><input class="form-control input-sm"
																		name="name" id="name" style="width: 200px"></input> <span
																		id="lnameMismatch"
																		style="color: red; font-size: 12px;"></span> <input
																		type="hidden" value="${consumer.patron.lastName}"
																		id="hiddenLastName" />
																</tr>
																<tr>
																	<td>&nbsp;</td>
																	<td>&nbsp;</td>
																</tr>
																<tr>
																	<td>&nbsp;</td>
																	<td><button type="button"
																			onclick="checkLastName()"
																			class="btn btn-primary btn-md" style="width: 150px;">Tr�nsito
																			Colegio</button></td>
																</tr>
															</tbody>
														</table>
														<div class="modal-footer">
															<div class="text-right pull-right col-md-3"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>

							</table>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</DIV>


	<script
		src="<c:url value='/static/assets/global/plugins/jquery.min.js' />"
		type="text/javascript"></script>

	<script type="text/javascript">
    /*  
     $("#infoCorrect").change(function() {
    	    if(this.checked) {
    	        if($('#violationPay').is(':checked')) {  $('#showPayButton').show(); }
    	    }else {
    	    	$('#showPayButton').hide();
    	    }
    	});
     
     $("#violationPay").change(function() {
    	 if($('#violationPay').is(':checked')) {
    		 if($('#infoCorrect').is(':checked')) {
    			 $('#showPayButton').show();
    		 }
    	 }else {
    		 $('#showPayButton').hide();
    	 }
     }); */
     $(document).ready(function() {
    	 document.getElementById('infoCorrectError').innerHTML = '';
    	 document.getElementById('consumerdetails1Error').innerHTML = '';
    	    $("#checkpay").click(function(){
    	    	if(!$('#infoCorrect').is(':checked')) {
    	    		document.getElementById('infoCorrectError').innerHTML = 'Seleccionar comprobar Caja';
    	    		document.getElementById('infoCorrect').focus();
    	    		return false;
       		    }
    	    	else{
    	    		document.getElementById('infoCorrectError').innerHTML = '';
    	    	}
    	    	if(!$('#violationPay').is(':checked')){
    	    		document.getElementById('consumerdetails1Error').innerHTML = 'Seleccionar Radio bot�n';
    	    		document.getElementById('violationPay').focus();
    	    		return false;
    	    	}
    	    	else{
    	    		document.getElementById('consumerdetails1Error').innerHTML = '';
    	    	}
    	    	
    	    }); 
    	});
</script>
	<script>
function checkLastName() {
    var lname = document.getElementById('hiddenLastName').value;
    var userSelName = document.getElementById('name').value;
    var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
    userSelName = userSelName.replace(rtrim, '');
    lname = lname.toUpperCase();
    userSelName = userSelName.toUpperCase();
    if(lname == userSelName) {
        window.location.href = '${pageContext.request.contextPath}/spanishTransit';
    }else {
        document.getElementById('lnameMismatch').innerHTML = 'por favor entrar en v�lido �ltimo Nombre';
    }    
}
</script>

</body>
</html>