package com.example.projectqlcv.controller;

import com.example.projectqlcv.DAO.ColumnDAO;
import com.example.projectqlcv.model.Card;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@WebServlet("/FileUploadServlet")
@MultipartConfig
public class UploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uploadDir = "/home/vanhuan/Documents/QuanLyCongViec/ProjectQLCV/src/main/webapp/WEB-INF/fileLink";

        Part filePart = request.getPart("file");

        // Kiểm tra xem có tệp được chọn hay không
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = extractFileName(filePart);

            // Kiểm tra xem tên tệp có hợp lệ không
            if (fileName != null && !fileName.isEmpty()) {
                Path filePath = Paths.get(uploadDir, fileName);

                try (InputStream fileContent = filePart.getInputStream()) {
                    Files.copy(fileContent, filePath, StandardCopyOption.REPLACE_EXISTING);
                }

                // Lấy đường link của tệp
                String fileLink = request.getContextPath() + "/WEB-INF/fileLink/" + fileName;
                // Lưu tên tệp và đường link vào MySQL
                saveToDatabase(fileName, "webapp/WEB-INF/fileLink"+fileLink);

                // Lưu tên tệp đã tải lên để hiển thị trong JSP
                request.setAttribute("uploadedFileName", fileName);
                request.setAttribute("fileLink", fileLink);

                // Chuyển hướng về trang JSP
                request.getRequestDispatcher("home/tableView.jsp").forward(request, response);
                return; // Kết thúc phương thức để ngăn chặn việc tiếp tục xử lý
            }
        }

        // Trường hợp không có tệp nào được chọn hoặc tên tệp không hợp lệ
        response.sendRedirect("home/tableView.jsp"); // Chuyển hướng về trang JSP mà bạn cần
    }

    private static String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");

        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf('=') + 1).trim().replace("\"", "");
            }
        }

        return null;
    }

    private void saveToDatabase(String fileName, String fileLink) {
        // Thực hiện kết nối đến cơ sở dữ liệu và thêm dữ liệu vào bảng card
        // Sử dụng ColumnDAO để thêm card với đường link vào cơ sở dữ liệu
        ColumnDAO columnDAO = new ColumnDAO();
        Card card = new Card();
        card.setName(fileName);
        card.setLink(fileLink);
        columnDAO.addCardLink(card);
    }
}