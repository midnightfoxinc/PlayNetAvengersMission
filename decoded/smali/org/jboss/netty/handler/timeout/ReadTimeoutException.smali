.class public Lorg/jboss/netty/handler/timeout/ReadTimeoutException;
.super Lorg/jboss/netty/handler/timeout/TimeoutException;
.source "ReadTimeoutException.java"


# static fields
.field private static final serialVersionUID:J = -0x3fc87b86a72e97f9L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/jboss/netty/handler/timeout/TimeoutException;-><init>()V

    .line 30
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/timeout/TimeoutException;-><init>(Ljava/lang/String;)V

    .line 44
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/handler/timeout/TimeoutException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/timeout/TimeoutException;-><init>(Ljava/lang/Throwable;)V

    .line 51
    return-void
.end method
