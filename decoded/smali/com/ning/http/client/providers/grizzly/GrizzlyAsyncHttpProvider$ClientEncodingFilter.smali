.class final Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ClientEncodingFilter;
.super Ljava/lang/Object;
.source "GrizzlyAsyncHttpProvider.java"

# interfaces
.implements Lorg/glassfish/grizzly/http/EncodingFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ClientEncodingFilter"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 1640
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;

    .prologue
    .line 1640
    invoke-direct {p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ClientEncodingFilter;-><init>()V

    return-void
.end method


# virtual methods
.method public applyDecoding(Lorg/glassfish/grizzly/http/HttpHeader;)Z
    .locals 5
    .param p1, "httpPacket"    # Lorg/glassfish/grizzly/http/HttpHeader;

    .prologue
    const/4 v2, 0x0

    .line 1653
    move-object v1, p1

    check-cast v1, Lorg/glassfish/grizzly/http/HttpResponsePacket;

    .line 1654
    .local v1, "httpResponse":Lorg/glassfish/grizzly/http/HttpResponsePacket;
    invoke-virtual {v1}, Lorg/glassfish/grizzly/http/HttpResponsePacket;->getHeaders()Lorg/glassfish/grizzly/http/util/MimeHeaders;

    move-result-object v3

    sget-object v4, Lorg/glassfish/grizzly/http/util/Header;->ContentEncoding:Lorg/glassfish/grizzly/http/util/Header;

    invoke-virtual {v3, v4}, Lorg/glassfish/grizzly/http/util/MimeHeaders;->getValue(Lorg/glassfish/grizzly/http/util/Header;)Lorg/glassfish/grizzly/http/util/DataChunk;

    move-result-object v0

    .line 1655
    .local v0, "bc":Lorg/glassfish/grizzly/http/util/DataChunk;
    if-eqz v0, :cond_0

    const-string v3, "gzip"

    invoke-virtual {v0, v3, v2}, Lorg/glassfish/grizzly/http/util/DataChunk;->indexOf(Ljava/lang/String;I)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    const/4 v2, 0x1

    :cond_0
    return v2
.end method

.method public applyEncoding(Lorg/glassfish/grizzly/http/HttpHeader;)Z
    .locals 1
    .param p1, "httpPacket"    # Lorg/glassfish/grizzly/http/HttpHeader;

    .prologue
    .line 1647
    const/4 v0, 0x0

    return v0
.end method
