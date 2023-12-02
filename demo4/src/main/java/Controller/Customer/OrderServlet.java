package Controller.Customer;

import Service.CartItemService;
import Service.impl.CartItemServiceImpl;
import model.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/order")
public class OrderServlet extends HttpServlet {
    
    CartItemService cartItemService = new CartItemServiceImpl();
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getOrders(req, resp);
        
        String action = req.getParameter("action");
        if (action != null){
            // If current user confirm the oder then create the order
            if (action.equalsIgnoreCase("isConfirmed")){
                action = "create";
            }
            if (action.equalsIgnoreCase("checkOrder")){
                checkOrder(req,resp);
                req.getRequestDispatcher("/orderdetails.jsp").forward(req, resp);
                return;
            }
            else if (action.equalsIgnoreCase("create")){
                createOrder(req, resp);
            }
            else if (action.equalsIgnoreCase("cancel")){
                cancelOrder(req, resp);
            }
        }
        displayOrders(req, resp);
    }
    
    public static void getOrders(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException{

    }
    
    protected void displayOrders(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException{

    }
    
    protected void checkOrder(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException{
        HttpSession session = req.getSession();
        String[] checkedProducts = req.getParameterValues("checkedProduct");
        List<CartItem> proceedProduct = new ArrayList<>();
        for (int i=0; i<checkedProducts.length; i++) {
            proceedProduct.add(cartItemService.findById(Integer.parseInt(checkedProducts[i])));
        }
        float tempPrice = 0;
        for (CartItem cartItem : proceedProduct){
            tempPrice += cartItem.getCartItemUnitPrice();
        }
        session.setAttribute("tempOrderPrice",tempPrice);
        session.setAttribute("tempOrder", proceedProduct);
        
    }
    
    protected void createOrder(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException{
        
    }
    
    protected void cancelOrder(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException{
        
    }
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
