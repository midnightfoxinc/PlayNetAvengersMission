.class public final enum Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;
.super Ljava/lang/Enum;
.source "StatusHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/StatusHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "InvocationStatus"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

.field public static final enum CONTINUE:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

.field public static final enum STOP:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 26
    new-instance v0, Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    const-string v1, "CONTINUE"

    invoke-direct {v0, v1, v2}, Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;->CONTINUE:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    new-instance v0, Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    const-string v1, "STOP"

    invoke-direct {v0, v1, v3}, Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;->STOP:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    .line 24
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    sget-object v1, Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;->CONTINUE:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    aput-object v1, v0, v2

    sget-object v1, Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;->STOP:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    aput-object v1, v0, v3

    sput-object v0, Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;->$VALUES:[Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 24
    const-class v0, Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    return-object v0
.end method

.method public static values()[Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;
    .locals 1

    .prologue
    .line 24
    sget-object v0, Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;->$VALUES:[Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    invoke-virtual {v0}, [Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    return-object v0
.end method
