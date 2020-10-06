package pack.order;
import java.util.Hashtable;

public class CartMgr {

	private Hashtable<String, OrderBean> hCart = new Hashtable<>();
	
	public void addCart(OrderBean obean) {
		String product_no = obean.getProduct_no();
		int quantity = Integer.parseInt(obean.getQuantity());
		
		if(quantity > 0) {
		//���� ��ǰ�� ���� �ֹ��� ���� �ֹ������� �����ؼ� īƮ�� ���
		 if(hCart.containsKey(product_no)) {
			 OrderBean imsi = (OrderBean)hCart.get(product_no);
			 quantity += Integer.parseInt(imsi.getQuantity());
			 imsi.setQuantity(Integer.toString(quantity));
			 hCart.put(product_no, imsi);
			// System.out.println("��ǰ��ȣ : " + product_no + ", �ֹ�����:" + quantity);
		 }else {
			 hCart.put(product_no, obean);
		 }
		}
	}
	
	public Hashtable<String, OrderBean> getCartList() {
		return hCart;
	}
	
	public void updateCart(OrderBean obean) {
		String product_no = obean.getProduct_no();
		hCart.put(product_no, obean);
	}
	
	public void deleteCart(OrderBean obean) {
		String product_no = obean.getProduct_no();
		hCart.remove(product_no);
	}
	
}