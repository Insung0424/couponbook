package sol.one.dao;

import java.util.List;

import sol.one.model.CartInfo;
import sol.one.model.OrderDetailInfo;
import sol.one.model.OrderInfo;
import sol.one.model.PaginationResult;


public interface OrderDAO {

    public void saveOrder(CartInfo cartInfo);

    public PaginationResult<OrderInfo> listOrderInfo(int page,
            int maxResult, int maxNavigationPage);
   
    public OrderInfo getOrderInfo(String orderId);
   
    public List<OrderDetailInfo> listOrderDetailInfos(String orderId);

}