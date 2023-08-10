package kz.runtime.shop.entities;

import jakarta.persistence.*;

@Entity
@Table
public class OrderProduct {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order;

    private Integer amountPerOrder;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getAmountPerOrder() {
        return amountPerOrder;
    }

    public void setAmountPerOrder(Integer amountPerOrder) {
        this.amountPerOrder = amountPerOrder;
    }
}
