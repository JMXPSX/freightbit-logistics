package com.sr.biz.freightbit.documentation.entity;

import com.sr.biz.freightbit.core.entity.Client;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by Clarence C. Victoria on 8/8/14.
 */

@Entity
@Table(name = "documents", catalog = "freightbit", uniqueConstraints = @UniqueConstraint(columnNames = "documentId"))
public class Documents implements Serializable {

    private Integer documentId;
    private String documentType;
    /*private Integer clientId;*/
    private Client client;
    private String documentName;
    private Integer referenceId;
    private String referenceTable;
    private String orderNumber;
    private Date createdDate;
    private String documentStatus;
    private Integer documentProcessed;
    private String referenceNumber;

    public Documents() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "documentId", unique = true)
    public Integer getDocumentId() {
        return documentId;
    }

    public void setDocumentId(Integer documentId) {
        this.documentId = documentId;
    }

    @Column(name = "documentType")
    public String getDocumentType() {
        return documentType;
    }

    public void setDocumentType(String documentType) {
        this.documentType = documentType;
    }

    /*@Column(name = "clientId")
    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }*/

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "clientId")
    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    @Column(name = "documentName")
	public String getDocumentName() {
		return documentName;
	}

	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}

	@Column(name = "referenceId")
	public Integer getReferenceId() {
		return referenceId;
	}

	public void setReferenceId(Integer referenceId) {
		this.referenceId = referenceId;
	}

	@Column(name = "referenceTable")
	public String getReferenceTable() {
		return referenceTable;
	}

	public void setReferenceTable(String referenceTable) {
		this.referenceTable = referenceTable;
	}

	@Column(name = "orderNumber")
	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	@Column(name = "createdDate")
	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

    @Column(name = "documentStatus")
    public String getDocumentStatus() {
        return documentStatus;
    }

    public void setDocumentStatus(String documentStatus) {
        this.documentStatus = documentStatus;
    }

    @Column(name = "documentProcessed")
    public Integer getDocumentProcessed() {
        return documentProcessed;
    }

    public void setDocumentProcessed(Integer documentProcessed) {
        this.documentProcessed = documentProcessed;
    }

    @Column(name = "referenceNumber")
    public String getReferenceNumber() {
        return referenceNumber;
    }

    public void setReferenceNumber(String referenceNumber) {
        this.referenceNumber = referenceNumber;
    }
}
