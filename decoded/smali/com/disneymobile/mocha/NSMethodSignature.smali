.class public Lcom/disneymobile/mocha/NSMethodSignature;
.super Ljava/lang/Object;
.source "NSMethodSignature.java"


# instance fields
.field private final method:Ljava/lang/reflect/Method;


# direct methods
.method public constructor <init>(Ljava/lang/reflect/Method;)V
    .locals 0
    .param p1, "method"    # Ljava/lang/reflect/Method;

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/disneymobile/mocha/NSMethodSignature;->method:Ljava/lang/reflect/Method;

    .line 11
    return-void
.end method


# virtual methods
.method public numberOfArguments()I
    .locals 1

    .prologue
    .line 14
    iget-object v0, p0, Lcom/disneymobile/mocha/NSMethodSignature;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    array-length v0, v0

    add-int/lit8 v0, v0, 0x2

    return v0
.end method
