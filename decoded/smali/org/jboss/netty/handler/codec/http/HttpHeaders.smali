.class public abstract Lorg/jboss/netty/handler/codec/http/HttpHeaders;
.super Ljava/lang/Object;
.source "HttpHeaders.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/http/HttpHeaders$Values;,
        Lorg/jboss/netty/handler/codec/http/HttpHeaders$Names;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Ljava/util/Map$Entry",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# static fields
.field public static final EMPTY_HEADERS:Lorg/jboss/netty/handler/codec/http/HttpHeaders;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    new-instance v0, Lorg/jboss/netty/handler/codec/http/HttpHeaders$1;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/http/HttpHeaders$1;-><init>()V

    sput-object v0, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->EMPTY_HEADERS:Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 1161
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addDateHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;Ljava/util/Date;)V
    .locals 1
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/util/Date;

    .prologue
    .line 809
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 810
    return-void
.end method

.method public static addHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 661
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 662
    return-void
.end method

.method public static addIntHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;I)V
    .locals 2
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # I

    .prologue
    .line 737
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 738
    return-void
.end method

.method public static clearHeaders(Lorg/jboss/netty/handler/codec/http/HttpMessage;)V
    .locals 1
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    .line 675
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->clear()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 676
    return-void
.end method

.method public static getContentLength(Lorg/jboss/netty/handler/codec/http/HttpMessage;)J
    .locals 6
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    .line 825
    const-string v1, "Content-Length"

    invoke-static {p0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 826
    .local v0, "value":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 827
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 834
    :cond_0
    return-wide v2

    .line 832
    :cond_1
    invoke-static {p0}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getWebSocketContentLength(Lorg/jboss/netty/handler/codec/http/HttpMessage;)I

    move-result v1

    int-to-long v2, v1

    .line 833
    .local v2, "webSocketContentLength":J
    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-gez v1, :cond_0

    .line 838
    new-instance v1, Ljava/lang/NumberFormatException;

    const-string v4, "header not found: Content-Length"

    invoke-direct {v1, v4}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getContentLength(Lorg/jboss/netty/handler/codec/http/HttpMessage;J)J
    .locals 7
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "defaultValue"    # J

    .prologue
    .line 852
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v4

    const-string v5, "Content-Length"

    invoke-virtual {v4, v5}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 853
    .local v0, "contentLength":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 855
    :try_start_0
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide p1

    .line 870
    .end local p1    # "defaultValue":J
    :cond_0
    :goto_0
    return-wide p1

    .line 856
    .restart local p1    # "defaultValue":J
    :catch_0
    move-exception v1

    .line 858
    .local v1, "e":Ljava/lang/NumberFormatException;
    goto :goto_0

    .line 864
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    :cond_1
    invoke-static {p0}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getWebSocketContentLength(Lorg/jboss/netty/handler/codec/http/HttpMessage;)I

    move-result v4

    int-to-long v2, v4

    .line 865
    .local v2, "webSocketContentLength":J
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-ltz v4, :cond_0

    move-wide p1, v2

    .line 866
    goto :goto_0
.end method

.method public static getDate(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Ljava/util/Date;
    .locals 1
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 936
    const-string v0, "Date"

    invoke-static {p0, v0}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getDateHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static getDate(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/util/Date;)Ljava/util/Date;
    .locals 1
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "defaultValue"    # Ljava/util/Date;

    .prologue
    .line 945
    const-string v0, "Date"

    invoke-static {p0, v0, p1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getDateHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;Ljava/util/Date;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static getDateHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;)Ljava/util/Date;
    .locals 4
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 750
    invoke-static {p0, p1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 751
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 752
    new-instance v1, Ljava/text/ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "header not found: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 754
    :cond_0
    invoke-static {}, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;->get()Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    return-object v1
.end method

.method public static getDateHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;Ljava/util/Date;)Ljava/util/Date;
    .locals 3
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/util/Date;

    .prologue
    .line 766
    invoke-static {p0, p1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 767
    .local v1, "value":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 775
    .end local p2    # "defaultValue":Ljava/util/Date;
    :goto_0
    return-object p2

    .line 772
    .restart local p2    # "defaultValue":Ljava/util/Date;
    :cond_0
    :try_start_0
    invoke-static {}, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;->get()Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p2

    goto :goto_0

    .line 773
    :catch_0
    move-exception v0

    .line 775
    .local v0, "e":Ljava/text/ParseException;
    goto :goto_0
.end method

.method public static getHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 604
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 616
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 617
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 620
    .end local p2    # "defaultValue":Ljava/lang/String;
    :goto_0
    return-object p2

    .restart local p2    # "defaultValue":Ljava/lang/String;
    :cond_0
    move-object p2, v0

    goto :goto_0
.end method

.method public static getHost(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Ljava/lang/String;
    .locals 2
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    .line 911
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    const-string v1, "Host"

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getHost(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 919
    const-string v0, "Host"

    invoke-static {p0, v0, p1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getIntHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;)I
    .locals 4
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 688
    invoke-static {p0, p1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 689
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 690
    new-instance v1, Ljava/lang/NumberFormatException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "header not found: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 692
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method public static getIntHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;I)I
    .locals 2
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # I

    .prologue
    .line 704
    invoke-static {p0, p1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 705
    .local v1, "value":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 713
    .end local p2    # "defaultValue":I
    :goto_0
    return p2

    .line 710
    .restart local p2    # "defaultValue":I
    :cond_0
    :try_start_0
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result p2

    goto :goto_0

    .line 711
    :catch_0
    move-exception v0

    .line 713
    .local v0, "e":Ljava/lang/NumberFormatException;
    goto :goto_0
.end method

.method private static getWebSocketContentLength(Lorg/jboss/netty/handler/codec/http/HttpMessage;)I
    .locals 5
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    .line 879
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    .line 880
    .local v0, "h":Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    instance-of v3, p0, Lorg/jboss/netty/handler/codec/http/HttpRequest;

    if-eqz v3, :cond_0

    move-object v1, p0

    .line 881
    check-cast v1, Lorg/jboss/netty/handler/codec/http/HttpRequest;

    .line 882
    .local v1, "req":Lorg/jboss/netty/handler/codec/http/HttpRequest;
    sget-object v3, Lorg/jboss/netty/handler/codec/http/HttpMethod;->GET:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->getMethod()Lorg/jboss/netty/handler/codec/http/HttpMethod;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v3, "Sec-WebSocket-Key1"

    invoke-virtual {v0, v3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->contains(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v3, "Sec-WebSocket-Key2"

    invoke-virtual {v0, v3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->contains(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 885
    const/16 v3, 0x8

    .line 897
    .end local v1    # "req":Lorg/jboss/netty/handler/codec/http/HttpRequest;
    :goto_0
    return v3

    .line 887
    :cond_0
    instance-of v3, p0, Lorg/jboss/netty/handler/codec/http/HttpResponse;

    if-eqz v3, :cond_1

    move-object v2, p0

    .line 888
    check-cast v2, Lorg/jboss/netty/handler/codec/http/HttpResponse;

    .line 889
    .local v2, "res":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    invoke-interface {v2}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getStatus()Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->getCode()I

    move-result v3

    const/16 v4, 0x65

    if-ne v3, v4, :cond_1

    const-string v3, "Sec-WebSocket-Origin"

    invoke-virtual {v0, v3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->contains(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v3, "Sec-WebSocket-Location"

    invoke-virtual {v0, v3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->contains(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 892
    const/16 v3, 0x10

    goto :goto_0

    .line 897
    .end local v2    # "res":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    :cond_1
    const/4 v3, -0x1

    goto :goto_0
.end method

.method public static is100ContinueExpected(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z
    .locals 5
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 965
    instance-of v3, p0, Lorg/jboss/netty/handler/codec/http/HttpRequest;

    if-nez v3, :cond_1

    .line 984
    :cond_0
    :goto_0
    return v1

    .line 970
    :cond_1
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->getProtocolVersion()Lorg/jboss/netty/handler/codec/http/HttpVersion;

    move-result-object v3

    sget-object v4, Lorg/jboss/netty/handler/codec/http/HttpVersion;->HTTP_1_1:Lorg/jboss/netty/handler/codec/http/HttpVersion;

    invoke-virtual {v3, v4}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->compareTo(Lorg/jboss/netty/handler/codec/http/HttpVersion;)I

    move-result v3

    if-ltz v3, :cond_0

    .line 975
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v3

    const-string v4, "Expect"

    invoke-virtual {v3, v4}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 976
    .local v0, "value":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 979
    const-string v1, "100-continue"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    move v1, v2

    .line 980
    goto :goto_0

    .line 984
    :cond_2
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v1

    const-string v3, "Expect"

    const-string v4, "100-continue"

    invoke-virtual {v1, v3, v4, v2}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->contains(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    goto :goto_0
.end method

.method public static isContentLengthSet(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z
    .locals 2
    .param p0, "m"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    .line 1158
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    const-string v1, "Content-Length"

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->contains(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isKeepAlive(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z
    .locals 5
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    const/4 v2, 0x0

    .line 546
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v3

    const-string v4, "Connection"

    invoke-virtual {v3, v4}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 548
    .local v1, "connection":Ljava/lang/String;
    const-string v3, "close"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    .line 549
    .local v0, "close":Z
    if-eqz v0, :cond_1

    .line 556
    :cond_0
    :goto_0
    return v2

    .line 553
    :cond_1
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->getProtocolVersion()Lorg/jboss/netty/handler/codec/http/HttpVersion;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->isKeepAliveDefault()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 554
    if-nez v0, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    .line 556
    :cond_2
    const-string v2, "keep-alive"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    goto :goto_0
.end method

.method public static isTransferEncodingChunked(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z
    .locals 4
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    .line 1130
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    const-string v1, "Transfer-Encoding"

    const-string v2, "chunked"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->contains(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static removeHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;)V
    .locals 1
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 668
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 669
    return-void
.end method

.method public static removeTransferEncodingChunked(Lorg/jboss/netty/handler/codec/http/HttpMessage;)V
    .locals 5
    .param p0, "m"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    .line 1134
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v3

    const-string v4, "Transfer-Encoding"

    invoke-virtual {v3, v4}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getAll(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 1135
    .local v1, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1150
    :goto_0
    return-void

    .line 1138
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 1139
    .local v2, "valuesIt":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1140
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1141
    .local v0, "value":Ljava/lang/String;
    const-string v3, "chunked"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1142
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_1

    .line 1145
    .end local v0    # "value":Ljava/lang/String;
    :cond_2
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1146
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v3

    const-string v4, "Transfer-Encoding"

    invoke-virtual {v3, v4}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    goto :goto_0

    .line 1148
    :cond_3
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v3

    const-string v4, "Transfer-Encoding"

    invoke-virtual {v3, v4, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Iterable;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    goto :goto_0
.end method

.method public static set100ContinueExpected(Lorg/jboss/netty/handler/codec/http/HttpMessage;)V
    .locals 1
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    .line 993
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set100ContinueExpected(Lorg/jboss/netty/handler/codec/http/HttpMessage;Z)V

    .line 994
    return-void
.end method

.method public static set100ContinueExpected(Lorg/jboss/netty/handler/codec/http/HttpMessage;Z)V
    .locals 3
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "set"    # Z

    .prologue
    .line 1004
    if-eqz p1, :cond_0

    .line 1005
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    const-string v1, "Expect"

    const-string v2, "100-continue"

    invoke-virtual {v0, v1, v2}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 1009
    :goto_0
    return-void

    .line 1007
    :cond_0
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    const-string v1, "Expect"

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    goto :goto_0
.end method

.method public static setContentLength(Lorg/jboss/netty/handler/codec/http/HttpMessage;J)V
    .locals 3
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "length"    # J

    .prologue
    .line 904
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    const-string v1, "Content-Length"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 905
    return-void
.end method

.method public static setDate(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/util/Date;)V
    .locals 3
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "value"    # Ljava/util/Date;

    .prologue
    .line 952
    if-eqz p1, :cond_0

    .line 953
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    const-string v1, "Date"

    invoke-static {}, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;->get()Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 957
    :goto_0
    return-void

    .line 955
    :cond_0
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    const-string v1, "Date"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Iterable;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    goto :goto_0
.end method

.method public static setDateHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;Ljava/lang/Iterable;)V
    .locals 1
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/handler/codec/http/HttpMessage;",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/util/Date;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 800
    .local p2, "values":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/util/Date;>;"
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Iterable;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 801
    return-void
.end method

.method public static setDateHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;Ljava/util/Date;)V
    .locals 2
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/util/Date;

    .prologue
    .line 786
    if-eqz p2, :cond_0

    .line 787
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    invoke-static {}, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;->get()Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;

    move-result-object v1

    invoke-virtual {v1, p2}, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 791
    :goto_0
    return-void

    .line 789
    :cond_0
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Iterable;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    goto :goto_0
.end method

.method public static setHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;Ljava/lang/Iterable;)V
    .locals 1
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/handler/codec/http/HttpMessage;",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 650
    .local p2, "values":Ljava/lang/Iterable;, "Ljava/lang/Iterable<*>;"
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Iterable;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 651
    return-void
.end method

.method public static setHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 632
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 633
    return-void
.end method

.method public static setHost(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;)V
    .locals 2
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 926
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    const-string v1, "Host"

    invoke-virtual {v0, v1, p1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 927
    return-void
.end method

.method public static setIntHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;I)V
    .locals 2
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # I

    .prologue
    .line 722
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 723
    return-void
.end method

.method public static setIntHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;Ljava/lang/Iterable;)V
    .locals 1
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/handler/codec/http/HttpMessage;",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 730
    .local p2, "values":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/Integer;>;"
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Iterable;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 731
    return-void
.end method

.method public static setKeepAlive(Lorg/jboss/netty/handler/codec/http/HttpMessage;Z)V
    .locals 3
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "keepAlive"    # Z

    .prologue
    .line 580
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    .line 581
    .local v0, "h":Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->getProtocolVersion()Lorg/jboss/netty/handler/codec/http/HttpVersion;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->isKeepAliveDefault()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 582
    if-eqz p1, :cond_0

    .line 583
    const-string v1, "Connection"

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 594
    :goto_0
    return-void

    .line 585
    :cond_0
    const-string v1, "Connection"

    const-string v2, "close"

    invoke-virtual {v0, v1, v2}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    goto :goto_0

    .line 588
    :cond_1
    if-eqz p1, :cond_2

    .line 589
    const-string v1, "Connection"

    const-string v2, "keep-alive"

    invoke-virtual {v0, v1, v2}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    goto :goto_0

    .line 591
    :cond_2
    const-string v1, "Connection"

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    goto :goto_0
.end method

.method public static setTransferEncodingChunked(Lorg/jboss/netty/handler/codec/http/HttpMessage;)V
    .locals 2
    .param p0, "m"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    .line 1153
    const-string v0, "Transfer-Encoding"

    const-string v1, "chunked"

    invoke-static {p0, v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->addHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1154
    const-string v0, "Content-Length"

    invoke-static {p0, v0}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->removeHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;)V

    .line 1155
    return-void
.end method

.method static validateHeaderName(Ljava/lang/String;)V
    .locals 4
    .param p0, "headerName"    # Ljava/lang/String;

    .prologue
    .line 1018
    if-nez p0, :cond_0

    .line 1019
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "Header names cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1022
    :cond_0
    const/4 v1, 0x0

    .local v1, "index":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 1024
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1025
    .local v0, "character":C
    invoke-static {v0}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->valideHeaderNameChar(C)V

    .line 1022
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1027
    .end local v0    # "character":C
    :cond_1
    return-void
.end method

.method static validateHeaderValue(Ljava/lang/String;)V
    .locals 6
    .param p0, "headerValue"    # Ljava/lang/String;

    .prologue
    .line 1053
    if-nez p0, :cond_0

    .line 1054
    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "Header values cannot be null"

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1066
    :cond_0
    const/4 v2, 0x0

    .line 1070
    .local v2, "state":I
    const/4 v1, 0x0

    .local v1, "index":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 1071
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1074
    .local v0, "character":C
    packed-switch v0, :pswitch_data_0

    .line 1084
    packed-switch v2, :pswitch_data_1

    .line 1070
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1076
    :pswitch_0
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Header value contains a prohibited character \'\\v\': "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1079
    :pswitch_1
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Header value contains a prohibited character \'\\f\': "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1086
    :pswitch_2
    packed-switch v0, :pswitch_data_2

    :pswitch_3
    goto :goto_1

    .line 1091
    :pswitch_4
    const/4 v2, 0x2

    goto :goto_1

    .line 1088
    :pswitch_5
    const/4 v2, 0x1

    .line 1089
    goto :goto_1

    .line 1096
    :pswitch_6
    packed-switch v0, :pswitch_data_3

    .line 1101
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Only \'\\n\' is allowed after \'\\r\': "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1098
    :pswitch_7
    const/4 v2, 0x2

    .line 1099
    goto :goto_1

    .line 1106
    :pswitch_8
    sparse-switch v0, :sswitch_data_0

    .line 1111
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Only \' \' and \'\\t\' are allowed after \'\\n\': "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1108
    :sswitch_0
    const/4 v2, 0x0

    .line 1109
    goto :goto_1

    .line 1117
    .end local v0    # "character":C
    :cond_1
    if-eqz v2, :cond_2

    .line 1118
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Header value must not end with \'\\r\' or \'\\n\':"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1121
    :cond_2
    return-void

    .line 1074
    nop

    :pswitch_data_0
    .packed-switch 0xb
        :pswitch_0
        :pswitch_1
    .end packed-switch

    .line 1084
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_2
        :pswitch_6
        :pswitch_8
    .end packed-switch

    .line 1086
    :pswitch_data_2
    .packed-switch 0xa
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_5
    .end packed-switch

    .line 1096
    :pswitch_data_3
    .packed-switch 0xa
        :pswitch_7
    .end packed-switch

    .line 1106
    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_0
        0x20 -> :sswitch_0
    .end sparse-switch
.end method

.method static valideHeaderNameChar(C)V
    .locals 3
    .param p0, "c"    # C

    .prologue
    .line 1031
    const/16 v0, 0x7f

    if-le p0, v0, :cond_0

    .line 1032
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Header name cannot contain non-ASCII characters: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1037
    :cond_0
    sparse-switch p0, :sswitch_data_0

    .line 1044
    return-void

    .line 1040
    :sswitch_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Header name cannot contain the following prohibited characters: =,;: \\t\\r\\n\\v\\f "

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1037
    nop

    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_0
        0xa -> :sswitch_0
        0xb -> :sswitch_0
        0xc -> :sswitch_0
        0xd -> :sswitch_0
        0x20 -> :sswitch_0
        0x2c -> :sswitch_0
        0x3a -> :sswitch_0
        0x3b -> :sswitch_0
        0x3d -> :sswitch_0
    .end sparse-switch
.end method


# virtual methods
.method public abstract add(Ljava/lang/String;Ljava/lang/Iterable;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable",
            "<*>;)",
            "Lorg/jboss/netty/handler/codec/http/HttpHeaders;"
        }
    .end annotation
.end method

.method public abstract add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;
.end method

.method public add(Lorg/jboss/netty/handler/codec/http/HttpHeaders;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .locals 4
    .param p1, "headers"    # Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .prologue
    .line 1248
    if-nez p1, :cond_0

    .line 1249
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "headers"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1251
    :cond_0
    invoke-virtual {p1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 1252
    .local v0, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    goto :goto_0

    .line 1254
    .end local v0    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    return-object p0
.end method

.method public abstract clear()Lorg/jboss/netty/handler/codec/http/HttpHeaders;
.end method

.method public abstract contains(Ljava/lang/String;)Z
.end method

.method public contains(Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "ignoreCaseValue"    # Z

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1333
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getAll(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .line 1334
    .local v2, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1349
    :cond_0
    :goto_0
    return v3

    .line 1338
    :cond_1
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1339
    .local v1, "v":Ljava/lang/String;
    if-eqz p3, :cond_3

    .line 1340
    invoke-virtual {v1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    move v3, v4

    .line 1341
    goto :goto_0

    .line 1344
    :cond_3
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    move v3, v4

    .line 1345
    goto :goto_0
.end method

.method public abstract entries()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end method

.method public abstract get(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getAll(Ljava/lang/String;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract isEmpty()Z
.end method

.method public abstract names()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;
.end method

.method public abstract set(Ljava/lang/String;Ljava/lang/Iterable;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable",
            "<*>;)",
            "Lorg/jboss/netty/handler/codec/http/HttpHeaders;"
        }
    .end annotation
.end method

.method public abstract set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;
.end method

.method public set(Lorg/jboss/netty/handler/codec/http/HttpHeaders;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .locals 4
    .param p1, "headers"    # Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .prologue
    .line 1299
    if-nez p1, :cond_0

    .line 1300
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "headers"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1302
    :cond_0
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->clear()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 1303
    invoke-virtual {p1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 1304
    .local v0, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    goto :goto_0

    .line 1306
    .end local v0    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    return-object p0
.end method
