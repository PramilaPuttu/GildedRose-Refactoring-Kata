<%-- 
    Document   : index
    Created on : 6 Aug, 2024, 9:43:06 PM
    Author     : Pramila P
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%--<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>--%>
<%@page import=" data.GildedRose"%>
<%@page import=" data.Item"%>
<%--<%@ include file="connection.jsp" %>--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gilded Rose Inventory</title>
</head>
<body>
    <h1>Gilded Rose Inventory</h1>
   <%
        List<Item> items = new ArrayList<>();
        items.add(new Item("+5 Dexterity Vest", 10, 20));
        items.add(new Item("Aged Brie", 2, 0));
//        items.add(new Item("Elixir of the Mongoose", 5, 7));
        items.add(new Item("Sulfuras", 0, 80));
        items.add(new Item("Sulfuras", -1, 80));
        items.add(new Item("Backstage passes", 15, 20));
        items.add(new Item("Backstage passes", 10, 49));
        items.add(new Item("Backstage passes", 5, 49));
        items.add(new Item("Conjured", 3, 6));

        GildedRose gildedRose = new GildedRose(items);
        int days = 2;
        if (request.getParameter("days") != null) {
            try {
                days = Integer.parseInt(request.getParameter("days")) + 1;
            } catch (NumberFormatException e) {
                days = 2;
            }
        }
    %>

    <%
        for (int day = 0; day < days; day++) {
    %>
        <h2>-------- day <%= day %> --------</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>name</th>
                    <th>sellIn</th>
                    <th>quality</th>
                </tr>
            </thead>
            <tbody>
                <%
                    gildedRose.updateQuality();
                    for (Item item : items) {
                %>
                    <tr>
                        <td><%= item.getName() %></td>
                        <td><%= item.getSellIn() %></td>
                        <td><%= item.getQuality() %></td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <br>
    <%
        }
    %>
</body>
</html>

