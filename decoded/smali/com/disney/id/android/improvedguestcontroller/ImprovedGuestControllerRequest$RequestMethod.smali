.class public final enum Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;
.super Ljava/lang/Enum;
.source "ImprovedGuestControllerRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "RequestMethod"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;

.field public static final enum GET:Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;

.field public static final enum POST:Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;


# instance fields
.field private id:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 103
    new-instance v0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;

    const-string v1, "GET"

    invoke-direct {v0, v1, v2, v2}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;->GET:Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;

    .line 104
    new-instance v0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;

    const-string v1, "POST"

    invoke-direct {v0, v1, v3, v3}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;->POST:Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;

    .line 102
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;

    sget-object v1, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;->GET:Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;

    aput-object v1, v0, v2

    sget-object v1, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;->POST:Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;

    aput-object v1, v0, v3

    sput-object v0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;->$VALUES:[Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "id"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 108
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 109
    iput p3, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;->id:I

    .line 110
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 102
    const-class v0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;

    return-object v0
.end method

.method public static values()[Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;
    .locals 1

    .prologue
    .line 102
    sget-object v0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;->$VALUES:[Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;

    invoke-virtual {v0}, [Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;

    return-object v0
.end method


# virtual methods
.method getId()I
    .locals 1

    .prologue
    .line 113
    iget v0, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;->id:I

    return v0
.end method
