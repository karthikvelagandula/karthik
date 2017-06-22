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

<title>Metro Transit Court</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

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
							</div> <br /> <br /> <br /> <c:if test="${not empty errorMessage}">
								<div class="alert alert-danger">
									<span>${errorMessage}</span>
								</div>
							</c:if>
							<table width="864">
								<tr>
									<td>
										<table border="0" cellpadding="2" cellspacing="2">
											<tr>
												<td><h3>
														<b> Sistema de Pago de Multas por Internet </b>
													</h3></td>
											</tr>
											<tr>
												<td align="left" class="heading1a"><a
													href="${pageContext.request.contextPath}/consumerlogin"><font
														color="blue"><u>Payment Instructions in English</u></font></a><br /></td>
											</tr>
											<tr>
												<td width="100%" class="bodySmall">Para pagar su multa
													de tránsito o de estacionamiento por el internet, siga por
													favor estas direcciones:<br />
													<ol>
														<li>Seleccione una de las siguientes opciones, número
															de infracción, número de plan de pago a plazos (IPP) e
															ingresela en la caja indicada.
															<ol type="a" style="font-weight: normal;">

																<li>El número de infracción esta situado en la
																	parte superior de la multa al lado derecho. Las
																	infracciones de tránsito cominenzan con la letra T y
																	las de estacionamiento con la letra P.</li>
																<li>El número de IPP esta situado en la parte
																	inferior de su formulario de inscripción del plan de
																	pago a plazos.</li>
															</ol>
														</li>
														<li>Seleccione el botón de ENVIAR para iniciar el
															processo seguro de pago con tarjeta de credito*. Este
															link o acoplamineto le llevara a un sitio de internet
															seguro.</li>
														<li>Siga las instrucciones para el proceso de pago en
															el sitio seguro internet.</li>
														<li>Espere la pagina de confirmacion. La pagina de
															confirmacion se puede imprimir para que la conserve.</li>
													</ol>
												</td>
											</tr>
											<tr>
												<td class="bodySmall"><b>Observe Por Favor:</b>
													<ol>
														<li>Las infracciónes pueden no estar inmediatamente
															disponibles para el pago después de la emisión.
															Infracciones están típicamente disponibles para el pago
															por internet dentro de una semana a partir de la fecha de
															la emisión.</li>
														<li>El sistema de pago por internet acepta Visa y
															Mastercard. Tenga por favor su información de la tarjeta
															de crédito disponible.</li>
														<li>Para las preguntas o las instrucciones
															adicionales, usted puede entrar en contacto con el
															Tribunal de Transporte de Metro en 213.92COURT
															(213.922.6878) entre las horas del 8 am a las 5 pm
															(tiempo Pacifico).</li>
														<li>Pagos se pueden enviar a:</li>
													</ol>

													<table width="100%" border="0" align="center"
														cellpadding="2" cellspacing="2">
														<tr>
															<td width="2%" class="bodySmall"></td>
															<td width="100%" class="bodySmall" valign="top"><b>Enviar
																	check o giro postal a <br /> nombre de Metro Transit
																	Court<br /> PO Box 866015<br /> Los Angeles, CA
																	90086-6015<br />
															</b>Escriba su número de cita(s) en su check o giro postal.</td>
														</tr>
													</table></td>
											</tr>
										</table>
										<table width="100%" border="0" align="center" cellpadding="10"
											cellspacing="10">
											<tr>
												<td class="bodySmall"><form:form id="consumerLoginForm"
														class="login-form" action="consumerloginSpanish"
														method="post" modelAttribute="consumerLoginBean">
														<input type="hidden" name="clientcode" value="1M">
														<input type="hidden" name="requestType" value="submit">
														<input type="hidden" name="requestCount" value="1">
														<input type="hidden" name="clientAccount" value="9">

														<table border="0" cellpadding="0" cellspacing="0"
															align="left" width="100%">
															<tr>
																<td colspan="2"><br /></td>
															</tr>
															<tr>
																<td colspan="2"></td>
															</tr>
															<tr>
																<td colspan="2" valign="center"><font
																	class="bodySmall"> <!-- -->
																</font></td>
																<td colspan="2" valign="center"><font
																	class="bodySmall"> <!-- -->
																</font></td>
															</tr>
															<tr>
																<td colspan="2"><font class="bodySmall"> <!-- -->
																</font> <font class="bodySmall"> <!-- -->
																</font></td>
															</tr>
															<tr>
																<td valign="top"><font class="bodySmall"><b>Introduzca
																			el número aquí y seleccione el tipo de multa debajo:</b></font>
																	<br> <form:input
																		class="form-control placeholder-no-fix" type="text"
																		autocomplete="off" placeholder="violación número"
																		name="citationId" maxlength="16" path="citationId"
																		style="width:200px" /></td>
																<td valign="top"><font class="bodySmall"> <!-- -->
																</font></td>
															</tr>
															<tr>
																<td valign="top"><input type="radio"
																	name="paymentType" value="T" checked="checked" /> <font
																	class="bodySmall" disabled>Número de infracción</font>
																	<br> <input type="radio" name="paymentType1"
																	value="I" disabled='disabled'> <font>Número
																		de plan de pago a plazos (IPP)</font><br></td>
																<td><font class="bodySmall"> <!-- -->
																</font></td>
															</tr>


															<tr>
																<td valign="bottom" colspan="2">Debe introducir el
																	número de IPP con el fin de hacer un pago a su plan de
																	pagos a plazos.</td>
															</tr>



															<tr>
																<td colspan="2" align="left"><input
																	class="btn green btn-sm" type="submit" name="submit"
																	value="Enviar"
																	onclick="document.inputForm.requestType.value='submit'"
																	class="field"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <!-- -->




																</td>
															</tr>
															<tr>
																<td colspan="2"><br></td>
															</tr>
														</table>
													</form:form></td>
											</tr>
										</table> <!-- <table width="100%" border="0" align="center" cellpadding="2"
									cellspacing="2">
									<tr>
										<td><font size="2">*This site has a <a class="red"
												href="javascript:checkVerisignCert()">Verisign Secure
													Site Certificate. </a></font></td>
									</tr>
								</table> -->

									</td>
								</tr>
							</table>

						</td>
					</tr>
				</table>
			</div>
		</div>
	</DIV>
</body>
</html>