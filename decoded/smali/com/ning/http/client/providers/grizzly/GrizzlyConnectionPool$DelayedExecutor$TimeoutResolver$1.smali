.class final Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver$1;
.super Ljava/lang/Object;
.source "GrizzlyConnectionPool.java"

# interfaces
.implements Lorg/glassfish/grizzly/utils/NullaryFunction;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/glassfish/grizzly/utils/NullaryFunction",
        "<",
        "Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver$IdleRecord;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 475
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public evaluate()Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver$IdleRecord;
    .locals 1

    .prologue
    .line 479
    new-instance v0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver$IdleRecord;

    invoke-direct {v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver$IdleRecord;-><init>()V

    return-object v0
.end method

.method public bridge synthetic evaluate()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 475
    invoke-virtual {p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver$1;->evaluate()Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver$IdleRecord;

    move-result-object v0

    return-object v0
.end method
