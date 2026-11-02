.class public final enum Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;
.super Ljava/lang/Enum;
.source "GrizzlyAsyncHttpProviderConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Property"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

.field public static final enum BUFFER_WEBSOCKET_FRAGMENTS:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

.field public static final enum MAX_HTTP_PACKET_HEADER_SIZE:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

.field public static final enum TRANSPORT_CUSTOMIZER:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;


# instance fields
.field final defaultValue:Ljava/lang/Object;

.field final type:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 54
    new-instance v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

    const-string v1, "TRANSPORT_CUSTOMIZER"

    const-class v2, Lcom/ning/http/client/providers/grizzly/TransportCustomizer;

    invoke-direct {v0, v1, v5, v2}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;->TRANSPORT_CUSTOMIZER:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

    .line 60
    new-instance v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

    const-string v1, "MAX_HTTP_PACKET_HEADER_SIZE"

    const-class v2, Ljava/lang/Integer;

    const/16 v3, 0x2000

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v0, v1, v4, v2, v3}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;-><init>(Ljava/lang/String;ILjava/lang/Class;Ljava/lang/Object;)V

    sput-object v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;->MAX_HTTP_PACKET_HEADER_SIZE:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

    .line 69
    new-instance v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

    const-string v1, "BUFFER_WEBSOCKET_FRAGMENTS"

    const-class v2, Ljava/lang/Boolean;

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-direct {v0, v1, v6, v2, v3}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;-><init>(Ljava/lang/String;ILjava/lang/Class;Ljava/lang/Object;)V

    sput-object v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;->BUFFER_WEBSOCKET_FRAGMENTS:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

    .line 42
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

    sget-object v1, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;->TRANSPORT_CUSTOMIZER:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

    aput-object v1, v0, v5

    sget-object v1, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;->MAX_HTTP_PACKET_HEADER_SIZE:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

    aput-object v1, v0, v4

    sget-object v1, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;->BUFFER_WEBSOCKET_FRAGMENTS:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

    aput-object v1, v0, v6

    sput-object v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;->$VALUES:[Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 83
    .local p3, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;-><init>(Ljava/lang/String;ILjava/lang/Class;Ljava/lang/Object;)V

    .line 84
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/Class;Ljava/lang/Object;)V
    .locals 0
    .param p4, "defaultValue"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 77
    .local p3, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 78
    iput-object p3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;->type:Ljava/lang/Class;

    .line 79
    iput-object p4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;->defaultValue:Ljava/lang/Object;

    .line 80
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 42
    const-class v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

    return-object v0
.end method

.method public static values()[Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;->$VALUES:[Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

    invoke-virtual {v0}, [Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

    return-object v0
.end method


# virtual methods
.method hasDefaultValue()Z
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;->defaultValue:Ljava/lang/Object;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
