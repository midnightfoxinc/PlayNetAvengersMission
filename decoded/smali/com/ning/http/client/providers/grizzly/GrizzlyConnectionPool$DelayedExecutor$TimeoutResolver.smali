.class final Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver;
.super Ljava/lang/Object;
.source "GrizzlyConnectionPool.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "TimeoutResolver"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver$IdleRecord;
    }
.end annotation


# static fields
.field private static final IDLE_ATTR:Lorg/glassfish/grizzly/attributes/Attribute;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/glassfish/grizzly/attributes/Attribute",
            "<",
            "Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver$IdleRecord;",
            ">;"
        }
    .end annotation
.end field

.field private static final IDLE_ATTRIBUTE_NAME:Ljava/lang/String; = "grizzly-ahc-conn-pool-idle-attribute"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 473
    sget-object v0, Lorg/glassfish/grizzly/Grizzly;->DEFAULT_ATTRIBUTE_BUILDER:Lorg/glassfish/grizzly/attributes/AttributeBuilder;

    const-string v1, "grizzly-ahc-conn-pool-idle-attribute"

    new-instance v2, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver$1;

    invoke-direct {v2}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver$1;-><init>()V

    invoke-interface {v0, v1, v2}, Lorg/glassfish/grizzly/attributes/AttributeBuilder;->createAttribute(Ljava/lang/String;Lorg/glassfish/grizzly/utils/NullaryFunction;)Lorg/glassfish/grizzly/attributes/Attribute;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver;->IDLE_ATTR:Lorg/glassfish/grizzly/attributes/Attribute;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 470
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 503
    return-void
.end method


# virtual methods
.method getTimeoutMs(Lorg/glassfish/grizzly/Connection;)J
    .locals 2
    .param p1, "c"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 493
    sget-object v0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver;->IDLE_ATTR:Lorg/glassfish/grizzly/attributes/Attribute;

    invoke-virtual {v0, p1}, Lorg/glassfish/grizzly/attributes/Attribute;->get(Lorg/glassfish/grizzly/attributes/AttributeStorage;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver$IdleRecord;

    iget-wide v0, v0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver$IdleRecord;->timeoutMs:J

    return-wide v0
.end method

.method removeTimeout(Lorg/glassfish/grizzly/Connection;)Z
    .locals 4
    .param p1, "c"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 488
    sget-object v0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver;->IDLE_ATTR:Lorg/glassfish/grizzly/attributes/Attribute;

    invoke-virtual {v0, p1}, Lorg/glassfish/grizzly/attributes/Attribute;->get(Lorg/glassfish/grizzly/attributes/AttributeStorage;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver$IdleRecord;

    const-wide/16 v2, 0x0

    iput-wide v2, v0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver$IdleRecord;->timeoutMs:J

    .line 489
    const/4 v0, 0x1

    return v0
.end method

.method setTimeoutMs(Lorg/glassfish/grizzly/Connection;J)V
    .locals 2
    .param p1, "c"    # Lorg/glassfish/grizzly/Connection;
    .param p2, "timeoutMs"    # J

    .prologue
    .line 497
    sget-object v0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver;->IDLE_ATTR:Lorg/glassfish/grizzly/attributes/Attribute;

    invoke-virtual {v0, p1}, Lorg/glassfish/grizzly/attributes/Attribute;->get(Lorg/glassfish/grizzly/attributes/AttributeStorage;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver$IdleRecord;

    iput-wide p2, v0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver$IdleRecord;->timeoutMs:J

    .line 498
    return-void
.end method
