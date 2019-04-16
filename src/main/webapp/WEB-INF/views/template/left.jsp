 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 <style>

..wrapper {
    display: flex;
    align-items: stretch;
    perspective: 1500px; 
}

#sidebar {
    min-width: 308px;
    max-width: 308px;
    transition: all 0.6s cubic-bezier(0.945, 0.020, 0.270, 0.665); /* 효과 */
    transform-origin: center left; /* Set the transformed position of sidebar to center left side. */
    z-index: 1500;
}

#sidebar.active {
    margin-left: -308px;
    transform: rotateY(100deg); /* Rotate sidebar vertically by 100 degrees. */
}
    
    
</style>
<div class="wrapper" >
   <nav id="sidebar" class="sidenav active">
    <ul class="main-buttons">
      <li>
        <i class="fa fa-circle fa-2x"></i>
        	Example
        <ul class="hidden">
          <li>TK-421</li>
          <li>why aren't </li>
          <li>you at </li>
          <li>your post?</li>
        </ul>
      </li>
      <li>
        <i class="fa fa-circle fa-2x"></i>
        	Example
        <ul class="hidden">
          <li>Dark</li>
          <li>Wings</li>
          <li>Dark</li>
          <li>Words</li>
          <li>John SNUUW</li>
        </ul>
      </li>
      <li>
        <i class="fa fa-circle fa-2x"></i>
         	Example
         <ul class="hidden">
          <li>Lorem</li>
          <li>Ipsum</li>
          <li>Dolor</li>
        </ul>
      </li>
    </ul>
</nav>
</div>