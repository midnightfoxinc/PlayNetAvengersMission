.class public abstract Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;
.super Ljava/lang/Object;
.source "GrizzlyAsyncHttpProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "BodyHandler"
.end annotation


# static fields
.field public static MAX_CHUNK_SIZE:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 1665
    const/16 v0, 0x2000

    sput v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;->MAX_CHUNK_SIZE:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 1663
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract doHandle(Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lcom/ning/http/client/Request;Lorg/glassfish/grizzly/http/HttpRequestPacket;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected getContentLength(Lcom/ning/http/client/Request;)J
    .locals 2
    .param p1, "request"    # Lcom/ning/http/client/Request;

    .prologue
    .line 1683
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getContentLength()J

    move-result-wide v0

    return-wide v0
.end method

.method public abstract handlesBodyType(Lcom/ning/http/client/Request;)Z
.end method
