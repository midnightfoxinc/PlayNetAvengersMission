.class public Lorg/jboss/netty/handler/timeout/WriteTimeoutException;
.super Lorg/jboss/netty/handler/timeout/TimeoutException;
.source "WriteTimeoutException.java"


# static fields
.field private static final serialVersionUID:J = -0x6b81c131fe9d52a2L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/jboss/netty/handler/timeout/TimeoutException;-><init>()V

    .line 31
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/timeout/TimeoutException;-><init>(Ljava/lang/String;)V

    .line 45
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 37
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/handler/timeout/TimeoutException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/timeout/TimeoutException;-><init>(Ljava/lang/Throwable;)V

    .line 52
    return-void
.end method
