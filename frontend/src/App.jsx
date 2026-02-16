import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './App.css';

function App() {
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [orderData, setOrderData] = useState({
    userId: 'user123',
    productId: '',
    quantity: 1
  });
  const [orderMessage, setOrderMessage] = useState('');

  const API_URL = import.meta.env.VITE_API_URL;

  useEffect(() => {
    fetchProducts();
  }, []);

  const fetchProducts = async () => {
    try {
      const response = await axios.get(`${API_URL}/products`);
      setProducts(response.data.products);
      setLoading(false);
    } catch (error) {
      console.error('Error fetching products:', error);
      setLoading(false);
    }
  };

  const placeOrder = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post(`${API_URL}/orders`, orderData);
      setOrderMessage(`✅ Order placed! ID: ${response.data.orderId}`);
      setTimeout(() => setOrderMessage(''), 5000);
    } catch (error) {
      setOrderMessage('❌ Order failed: ' + error.message);
    }
  };

  if (loading) return <div className="container">Loading products...</div>;

  return (
    <div className="container">
      <h1>🚀 Flash Sale E-Commerce</h1>
      
      <div className="products-grid">
        {products.map(product => (
          <div key={product.productId} className="product-card">
            <img src={product.imageUrl || 'https://via.placeholder.com/200'} alt={product.name} />
            <h3>{product.name}</h3>
            <p>{product.description}</p>
            <p className="price">₹{product.price}</p>
            <p className="stock">{product.inStock} in stock</p>
            <button onClick={() => setOrderData({...orderData, productId: product.productId})}>
              Select
            </button>
          </div>
        ))}
      </div>

      <div className="order-form">
        <h2>Place Order</h2>
        {orderMessage && <div className="message">{orderMessage}</div>}
        <form onSubmit={placeOrder}>
          <input
            type="text"
            placeholder="User ID"
            value={orderData.userId}
            onChange={(e) => setOrderData({...orderData, userId: e.target.value})}
            required
          />
          <input
            type="text"
            placeholder="Product ID"
            value={orderData.productId}
            onChange={(e) => setOrderData({...orderData, productId: e.target.value})}
            required
          />
          <input
            type="number"
            placeholder="Quantity"
            value={orderData.quantity}
            onChange={(e) => setOrderData({...orderData, quantity: parseInt(e.target.value)})}
            min="1"
            required
          />
          <button type="submit">Buy Now</button>
        </form>
      </div>
    </div>
  );
}

export default App;
