.class public abstract Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;
.super Ljava/lang/Object;
.source "WebDavCompletionHandlerBase.java"

# interfaces
.implements Lcom/ning/http/client/AsyncHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/ning/http/client/AsyncHandler",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final bodies:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/HttpResponseBodyPart;",
            ">;"
        }
    .end annotation
.end field

.field private headers:Lcom/ning/http/client/HttpResponseHeaders;

.field private final logger:Lorg/slf4j/Logger;

.field private status:Lcom/ning/http/client/HttpResponseStatus;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 49
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const-class v0, Lcom/ning/http/client/AsyncCompletionHandlerBase;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;->logger:Lorg/slf4j/Logger;

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;->bodies:Ljava/util/List;

    .line 103
    return-void
.end method

.method private parse(Lorg/w3c/dom/Document;)V
    .locals 9
    .param p1, "document"    # Lorg/w3c/dom/Document;

    .prologue
    .line 272
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase<TT;>;"
    invoke-interface {p1}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v0

    .line 273
    .local v0, "element":Lorg/w3c/dom/Element;
    const-string v7, "status"

    invoke-interface {v0, v7}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v4

    .line 274
    .local v4, "statusNode":Lorg/w3c/dom/NodeList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v4}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v7

    if-ge v1, v7, :cond_0

    .line 275
    invoke-interface {v4, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 277
    .local v2, "node":Lorg/w3c/dom/Node;
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v7

    invoke-interface {v7}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v6

    .line 278
    .local v6, "value":Ljava/lang/String;
    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    const-string v8, " "

    invoke-virtual {v6, v8}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 279
    .local v3, "statusCode":I
    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 280
    .local v5, "statusText":Ljava/lang/String;
    new-instance v7, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;

    iget-object v8, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;->status:Lcom/ning/http/client/HttpResponseStatus;

    invoke-direct {v7, p0, v8, v5, v3}, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;-><init>(Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;Lcom/ning/http/client/HttpResponseStatus;Ljava/lang/String;I)V

    iput-object v7, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;->status:Lcom/ning/http/client/HttpResponseStatus;

    .line 274
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 282
    .end local v2    # "node":Lorg/w3c/dom/Node;
    .end local v3    # "statusCode":I
    .end local v5    # "statusText":Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private readXMLResponse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;
    .locals 5
    .param p1, "stream"    # Ljava/io/InputStream;

    .prologue
    .line 253
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase<TT;>;"
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v2

    .line 254
    .local v2, "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    const/4 v0, 0x0

    .line 256
    .local v0, "document":Lorg/w3c/dom/Document;
    :try_start_0
    invoke-virtual {v2}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 257
    invoke-direct {p0, v0}, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;->parse(Lorg/w3c/dom/Document;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_2

    .line 268
    return-object v0

    .line 258
    :catch_0
    move-exception v1

    .line 259
    .local v1, "e":Lorg/xml/sax/SAXException;
    iget-object v3, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;->logger:Lorg/slf4j/Logger;

    invoke-virtual {v1}, Lorg/xml/sax/SAXException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 260
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 261
    .end local v1    # "e":Lorg/xml/sax/SAXException;
    :catch_1
    move-exception v1

    .line 262
    .local v1, "e":Ljava/io/IOException;
    iget-object v3, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;->logger:Lorg/slf4j/Logger;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 263
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 264
    .end local v1    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v1

    .line 265
    .local v1, "e":Ljavax/xml/parsers/ParserConfigurationException;
    iget-object v3, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;->logger:Lorg/slf4j/Logger;

    invoke-virtual {v1}, Ljavax/xml/parsers/ParserConfigurationException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 266
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method


# virtual methods
.method public final onBodyPartReceived(Lcom/ning/http/client/HttpResponseBodyPart;)Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 1
    .param p1, "content"    # Lcom/ning/http/client/HttpResponseBodyPart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 59
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;->bodies:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    sget-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    return-object v0
.end method

.method public final onCompleted()Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 77
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase<TT;>;"
    iget-object v2, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;->status:Lcom/ning/http/client/HttpResponseStatus;

    if-eqz v2, :cond_1

    .line 78
    iget-object v2, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;->status:Lcom/ning/http/client/HttpResponseStatus;

    iget-object v3, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;->headers:Lcom/ning/http/client/HttpResponseHeaders;

    iget-object v4, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;->bodies:Ljava/util/List;

    invoke-virtual {v2, v3, v4}, Lcom/ning/http/client/HttpResponseStatus;->prepareResponse(Lcom/ning/http/client/HttpResponseHeaders;Ljava/util/List;)Lcom/ning/http/client/Response;

    move-result-object v1

    .line 79
    .local v1, "response":Lcom/ning/http/client/Response;
    const/4 v0, 0x0

    .line 80
    .local v0, "document":Lorg/w3c/dom/Document;
    iget-object v2, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;->status:Lcom/ning/http/client/HttpResponseStatus;

    invoke-virtual {v2}, Lcom/ning/http/client/HttpResponseStatus;->getStatusCode()I

    move-result v2

    const/16 v3, 0xcf

    if-ne v2, v3, :cond_0

    .line 81
    invoke-interface {v1}, Lcom/ning/http/client/Response;->getResponseBodyAsStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;->readXMLResponse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 83
    :cond_0
    new-instance v2, Lcom/ning/http/client/webdav/WebDavResponse;

    iget-object v3, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;->status:Lcom/ning/http/client/HttpResponseStatus;

    iget-object v4, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;->headers:Lcom/ning/http/client/HttpResponseHeaders;

    iget-object v5, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;->bodies:Ljava/util/List;

    invoke-virtual {v3, v4, v5}, Lcom/ning/http/client/HttpResponseStatus;->prepareResponse(Lcom/ning/http/client/HttpResponseHeaders;Ljava/util/List;)Lcom/ning/http/client/Response;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lcom/ning/http/client/webdav/WebDavResponse;-><init>(Lcom/ning/http/client/Response;Lorg/w3c/dom/Document;)V

    invoke-virtual {p0, v2}, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;->onCompleted(Lcom/ning/http/client/webdav/WebDavResponse;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 85
    .end local v0    # "document":Lorg/w3c/dom/Document;
    .end local v1    # "response":Lcom/ning/http/client/Response;
    :cond_1
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Status is null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public abstract onCompleted(Lcom/ning/http/client/webdav/WebDavResponse;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/webdav/WebDavResponse;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public final onHeadersReceived(Lcom/ning/http/client/HttpResponseHeaders;)Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 1
    .param p1, "headers"    # Lcom/ning/http/client/HttpResponseHeaders;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 71
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase<TT;>;"
    iput-object p1, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;->headers:Lcom/ning/http/client/HttpResponseHeaders;

    .line 72
    sget-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    return-object v0
.end method

.method public final onStatusReceived(Lcom/ning/http/client/HttpResponseStatus;)Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 1
    .param p1, "status"    # Lcom/ning/http/client/HttpResponseStatus;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 65
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase<TT;>;"
    iput-object p1, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;->status:Lcom/ning/http/client/HttpResponseStatus;

    .line 66
    sget-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    return-object v0
.end method

.method public onThrowable(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 91
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;->logger:Lorg/slf4j/Logger;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 92
    return-void
.end method
