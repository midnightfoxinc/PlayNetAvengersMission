.class final Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat$1;
.super Ljava/lang/ThreadLocal;
.source "HttpHeaderDateFormat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ThreadLocal",
        "<",
        "Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic initialValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 41
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat$1;->initialValue()Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;

    move-result-object v0

    return-object v0
.end method

.method protected initialValue()Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;
    .locals 2

    .prologue
    .line 44
    new-instance v0, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;-><init>(Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat$1;)V

    return-object v0
.end method
